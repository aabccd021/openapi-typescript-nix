{

  nixConfig.allow-import-from-derivation = false;

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.treefmt-nix.url = "github:numtide/treefmt-nix";
  inputs.bun2nix.url = "github:baileyluTCD/bun2nix";

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

      nodeModules = inputs.bun2nix.lib.x86_64-linux.mkBunNodeModules {
        packages = import ./bun.nix;
      };

      overlay = (
        final: prev: {
          openapi-typescript = final.writeShellApplication {
            name = "openapi-typescript";
            text = ''
              ln -s ${nodeModules}/node_modules ./node_modules
              exec ${final.bun}/bin/bunx --bun openapi-typescript "$@"
            '';
          };

        }
      );

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
        bun2nix = inputs.bun2nix.packages.x86_64-linux.default;
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
