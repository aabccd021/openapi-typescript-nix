{

  nixConfig.allow-import-from-derivation = false;

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.treefmt-nix.url = "github:numtide/treefmt-nix";

  outputs =
    { self, ... }@inputs:
    let
      lib = inputs.nixpkgs.lib;

      collectInputs =
        is:
        pkgs.linkFarm "inputs" (
          builtins.mapAttrs (
            name: i:
            pkgs.linkFarm name {
              self = i.outPath;
              deps = collectInputs (lib.attrByPath [ "inputs" ] { } i);
            }
          ) is
        );

      overlay = (
        final: prev:
        let
          npm_deps = import ./npm_deps.nix { pkgs = final; };
        in
        {
          openapi-typescript = final.writeShellApplication {
            name = "openapi-typescript";
            text = ''
              exec ${final.bun}/bin/bun --bun \
                ${npm_deps}/lib/node_modules/openapi-typescript/bin/cli.js "$@"
            '';
          };

        }
      );

      update-npm-deps = pkgs.writeShellApplication {
        name = "update-npm-deps";
        text = ''
          repo_root=$(git rev-parse --show-toplevel)
          nix run github:aabccd021/bun3nix install openapi-typescript > "$repo_root/npm_deps.nix"
        '';
      };

      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        overlays = [ overlay ];
      };

      treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs {
        projectRootFile = "flake.nix";
        programs.nixfmt.enable = true;
        programs.prettier.enable = true;
        settings.global.excludes = [ "LICENSE" ];
      };

      formatter = treefmtEval.config.build.wrapper;

      testSchema = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/PaddleHQ/paddle-openapi/refs/heads/main/v1/openapi.yaml";
        hash = "sha256-5XxRUHfMhbQs5wIQBJ5QqjTV/Q0YXc7gcdESCjLcS1A=";
      };

      test = pkgs.runCommand "test" { } ''
        mkdir --parent "$out"
        ${pkgs.openapi-typescript}/bin/openapi-typescript ${testSchema} --output "$out/paddle.ts"
      '';

      devShells.default = pkgs.mkShellNoCC {
        buildInputs = [
          pkgs.bun
          pkgs.nixd
        ];
      };

      packages = devShells // {
        test = test;
        formatting = treefmtEval.config.build.check self;
        formatter = formatter;
        allInputs = collectInputs inputs;
        openapi-typescript = pkgs.openapi-typescript;
        default = pkgs.openapi-typescript;
        update-npm-deps = update-npm-deps;
      };
    in
    {
      packages.x86_64-linux = packages // {
        gcroot = pkgs.linkFarm "gcroot" packages;
      };

      checks.x86_64-linux = packages;
      formatter.x86_64-linux = formatter;
      overlays.default = overlay;
      devShells.x86_64-linux = devShells;
    };
}
