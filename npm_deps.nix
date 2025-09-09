{
  pkgs ? import <nixpkgs> { },
  ...
}:
let
  lib = pkgs.lib;
  extractTarball =
    src:
    pkgs.runCommand "extracted-${src.name}" { } ''
      mkdir "$out"
      ${pkgs.libarchive}/bin/bsdtar -xf ${src} --strip-components 1 -C "$out"
    '';
  packages = {
    "node_modules/@babel/code-frame/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.27.1.tgz";
        hash = "sha512-cjQ7ZlQ0Mv3b47hABuTevyTuYN4i+loJKGeV9flcCgIK37cCXRh+L1bd3iBHlynerhQ7BhCkn2BPbQUL+rGqFg==";
      }
    );
    "node_modules/@babel/helper-validator-identifier/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/@babel/helper-validator-identifier/-/helper-validator-identifier-7.27.1.tgz";
        hash = "sha512-D2hP9eA+Sqx1kBZgzxZh0y1trbuU+JoDkiEwqhQ36nodYqJwyEIhPSdMNd7lOm/4io72luTPWH20Yda0xOuUow==";
      }
    );
    "node_modules/@redocly/ajv/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/@redocly/ajv/-/ajv-8.11.3.tgz";
        hash = "sha512-4P3iZse91TkBiY+Dx5DUgxQ9GXkVJf++cmI0MOyLDxV9b5MUBI4II6ES8zA5JCbO72nKAJxWrw4PUPW+YP3ZDQ==";
      }
    );
    "node_modules/@redocly/config/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/@redocly/config/-/config-0.22.2.tgz";
        hash = "sha512-roRDai8/zr2S9YfmzUfNhKjOF0NdcOIqF7bhf4MVC5UxpjIysDjyudvlAiVbpPHp3eDRWbdzUgtkK1a7YiDNyQ==";
      }
    );
    "node_modules/@redocly/openapi-core/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/@redocly/openapi-core/-/openapi-core-1.34.5.tgz";
        hash = "sha512-0EbE8LRbkogtcCXU7liAyC00n9uNG9hJ+eMyHFdUsy9lB/WGqnEBgwjA9q2cyzAVcdTkQqTBBU1XePNnN3OijA==";
      }
    );
    "node_modules/agent-base/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/agent-base/-/agent-base-7.1.4.tgz";
        hash = "sha512-MnA+YT8fwfJPgBx3m60MNqakm30XOkyIoH1y6huTQvC0PwZG7ki8NacLBcrPbNoo8vEZy7Jpuk7+jMO+CUovTQ==";
      }
    );
    "node_modules/ansi-colors/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/ansi-colors/-/ansi-colors-4.1.3.tgz";
        hash = "sha512-/6w/C21Pm1A7aZitlI5Ni/2J6FFQN8i1Cvz3kHABAAbw93v/NlvKdVOqz7CCWz/3iv/JplRSEEZ83XION15ovw==";
      }
    );
    "node_modules/argparse/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/argparse/-/argparse-2.0.1.tgz";
        hash = "sha512-8+9WqebbFzpX9OR+Wa6O29asIogeRMzcGtAINdpMHHyAg10f05aSFVBbcEqGf/PXw1EjAZ+q2/bEBg3DvurK3Q==";
      }
    );
    "node_modules/balanced-match/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz";
        hash = "sha512-3oSeUO0TMV67hN1AmbXsK4yaqU7tjiHlbxRDZOpH0KW9+CeX4bRAaX0Anxt0tx2MrpRpWwQaPwIlISEJhYU5Pw==";
      }
    );
    "node_modules/brace-expansion/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/brace-expansion/-/brace-expansion-2.0.2.tgz";
        hash = "sha512-Jt0vHyM+jmUBqojB7E1NIYadt0vI0Qxjxd2TErW94wDz+E2LAm5vKMXXwg6ZZBTHPuUlDgQHKXvjGBdfcF1ZDQ==";
      }
    );
    "node_modules/change-case/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/change-case/-/change-case-5.4.4.tgz";
        hash = "sha512-HRQyTk2/YPEkt9TnUPbOpr64Uw3KOicFWPVBb+xiHvd6eBx/qPr9xqfBFDT8P2vWsvvz4jbEkfDe71W3VyNu2w==";
      }
    );
    "node_modules/colorette/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/colorette/-/colorette-1.4.0.tgz";
        hash = "sha512-Y2oEozpomLn7Q3HFP7dpww7AtMJplbM9lGZP6RDfHqmbeRjiwRg4n6VM6j4KLmRke85uWEI7JqF17f3pqdRA0g==";
      }
    );
    "node_modules/debug/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/debug/-/debug-4.4.1.tgz";
        hash = "sha512-KcKCqiftBJcZr++7ykoDIEwSa3XWowTfNPo92BYxjXiyYEVrUQh2aLyhxBCwww+heortUFxEJYcRzosstTEBYQ==";
      }
    );
    "node_modules/fast-deep-equal/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/fast-deep-equal/-/fast-deep-equal-3.1.3.tgz";
        hash = "sha512-f3qQ9oQy9j2AhBe/H9VC91wLmKBCCU/gDOnKNAYG5hswO7BLKj09Hc5HYNz9cGI++xlpDCIgDaitVs03ATR84Q==";
      }
    );
    "node_modules/https-proxy-agent/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/https-proxy-agent/-/https-proxy-agent-7.0.6.tgz";
        hash = "sha512-vK9P5/iUfdl95AI+JVyUuIcVtd4ofvtrOr3HNtM2yxC9bnMbEdp3x01OhQNnjb8IJYi38VlTE3mBXwcfvywuSw==";
      }
    );
    "node_modules/index-to-position/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/index-to-position/-/index-to-position-1.1.0.tgz";
        hash = "sha512-XPdx9Dq4t9Qk1mTMbWONJqU7boCoumEH7fRET37HX5+khDUl3J2W6PdALxhILYlIYx2amlwYcRPp28p0tSiojg==";
      }
    );
    "node_modules/js-levenshtein/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/js-levenshtein/-/js-levenshtein-1.1.6.tgz";
        hash = "sha512-X2BB11YZtrRqY4EnQcLX5Rh373zbK4alC1FW7D7MBhL2gtcC17cTnr6DmfHZeS0s2rTHjUTMMHfG7gO8SSdw+g==";
      }
    );
    "node_modules/js-tokens/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/js-tokens/-/js-tokens-4.0.0.tgz";
        hash = "sha512-RdJUflcE3cUzKiMqQgsCu06FPu9UdIJO0beYbPhHN4k6apgJtifcoCtT9bcxOpYBtpD2kCM6Sbzg4CausW/PKQ==";
      }
    );
    "node_modules/js-yaml/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/js-yaml/-/js-yaml-4.1.0.tgz";
        hash = "sha512-wpxZs9NoxZaJESJGIZTyDEaYpl0FKSA+FB9aJiyemKhMwkxQg63h4T1KJgUGHpTqPDNRcmmYLugrRjJlBtWvRA==";
      }
    );
    "node_modules/json-schema-traverse/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/json-schema-traverse/-/json-schema-traverse-1.0.0.tgz";
        hash = "sha512-NM8/P9n3XjXhIZn1lLhkFaACTOURQXjWhV4BA/RnOv8xvgqtqpAX9IO4mRQxSx1Rlo4tqzeqb0sOlruaOy3dug==";
      }
    );
    "node_modules/minimatch/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/minimatch/-/minimatch-5.1.6.tgz";
        hash = "sha512-lKwV/1brpG6mBUFHtb7NUmtABCb2WZZmm2wNiOA5hAb8VdCS4B3dtMWyvcoViccwAW/COERjXLt0zP1zXUN26g==";
      }
    );
    "node_modules/ms/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz";
        hash = "sha512-6FlzubTLZG3J2a/NVCAleEhjzq5oxgHyaCU9yYXvcLsvoVaHJq/s5xXI6/XXP6tz7R9xAOtHnSO/tXtF3WRTlA==";
      }
    );
    "node_modules/openapi-typescript/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/openapi-typescript/-/openapi-typescript-7.9.1.tgz";
        hash = "sha512-9gJtoY04mk6iPMbToPjPxEAtfXZ0dTsMZtsgUI8YZta0btPPig9DJFP4jlerQD/7QOwYgb0tl+zLUpDf7vb7VA==";
      }
    );
    "node_modules/parse-json/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/parse-json/-/parse-json-8.3.0.tgz";
        hash = "sha512-ybiGyvspI+fAoRQbIPRddCcSTV9/LsJbf0e/S85VLowVGzRmokfneg2kwVW/KU5rOXrPSbF1qAKPMgNTqqROQQ==";
      }
    );
    "node_modules/picocolors/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/picocolors/-/picocolors-1.1.1.tgz";
        hash = "sha512-xceH2snhtb5M9liqDsmEw56le376mTZkEX/jEb/RxNFyegNul7eNslCXP9FDj/Lcu0X8KEyMceP2ntpaHrDEVA==";
      }
    );
    "node_modules/pluralize/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/pluralize/-/pluralize-8.0.0.tgz";
        hash = "sha512-Nc3IT5yHzflTfbjgqWcCPpo7DaKy4FnpB0l/zCAW0Tc7jxAiuqSxHasntB3D7887LSrA93kDJ9IXovxJYxyLCA==";
      }
    );
    "node_modules/require-from-string/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/require-from-string/-/require-from-string-2.0.2.tgz";
        hash = "sha512-Xf0nWe6RseziFMu+Ap9biiUbmplq6S9/p+7w7YXP/JBHhrUDDUhwa+vANyubuqfZWTveU//DYVGsDG7RKL/vEw==";
      }
    );
    "node_modules/supports-color/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/supports-color/-/supports-color-10.2.2.tgz";
        hash = "sha512-SS+jx45GF1QjgEXQx4NJZV9ImqmO2NPz5FNsIHrsDjh2YsHnawpan7SNQ1o8NuhrbHZy9AZhIoCUiCeaW/C80g==";
      }
    );
    "node_modules/type-fest/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/type-fest/-/type-fest-4.41.0.tgz";
        hash = "sha512-TeTSQ6H5YHvpqVwBRcnLDCBnDOHWYu7IvGbHT6N8AOymcr9PJGjc1GTtiWZTYg0NCgYwvnYWEkVChQAr9bjfwA==";
      }
    );
    "node_modules/typescript/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/typescript/-/typescript-5.9.2.tgz";
        hash = "sha512-CWBzXQrc/qOkhidw1OzBTQuYRbfyxDXJMVJ1XNwUHGROVmuaeiEm3OslpZ1RV96d7SKKjZKrSJu3+t/xlw3R9A==";
      }
    );
    "node_modules/uri-js-replace/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/uri-js-replace/-/uri-js-replace-1.0.1.tgz";
        hash = "sha512-W+C9NWNLFOoBI2QWDp4UT9pv65r2w5Cx+3sTYFvtMdDBxkKt1syCqsUdSFAChbEe1uK5TfS04wt/nGwmaeIQ0g==";
      }
    );
    "node_modules/yaml-ast-parser/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/yaml-ast-parser/-/yaml-ast-parser-0.0.43.tgz";
        hash = "sha512-2PTINUwsRqSd+s8XxKaJWQlUuEMHJQyEuh2edBbW8KNJz0SJPwUSD2zRWqezFEdN7IzAgeuYHFUCF7o8zRdZ0A==";
      }
    );
    "node_modules/yargs-parser/" = extractTarball (
      pkgs.fetchurl {
        url = "https://registry.npmjs.org/yargs-parser/-/yargs-parser-21.1.1.tgz";
        hash = "sha512-tVpsJW7DdjecAiFpbIB1e3qxIQsE6NoPc5/eTdrbbIC4h0LVsWhnoa3g+m2HclBIujHzsxZ4VJVA+GUuc2/LBw==";
      }
    );
  };
  packageCommands = lib.pipe packages [
    (lib.mapAttrsToList (
      modulePath: package: ''
        mkdir -p "$out/lib/${modulePath}"
        cp -Lr ${package}/* "$out/lib/${modulePath}"
        chmod -R u+w "$out/lib/${modulePath}"
      ''
    ))
    (lib.concatStringsSep "\n")
  ];
in
(pkgs.runCommand "node_modules" { buildInputs = [ pkgs.nodejs ]; } ''
  ${packageCommands}
  mkdir -p "$out/lib/node_modules/.bin"
  patchShebangs --host "$out/lib/node_modules/js-yaml/bin/js-yaml.js"
  ln -s "$out/lib/node_modules/js-yaml/bin/js-yaml.js" "$out/lib/node_modules/.bin/js-yaml"
  patchShebangs --host "$out/lib/node_modules/openapi-typescript/bin/cli.js"
  ln -s "$out/lib/node_modules/openapi-typescript/bin/cli.js" "$out/lib/node_modules/.bin/openapi-typescript"
  patchShebangs --host "$out/lib/node_modules/typescript/bin/tsc"
  ln -s "$out/lib/node_modules/typescript/bin/tsc" "$out/lib/node_modules/.bin/tsc"
  patchShebangs --host "$out/lib/node_modules/typescript/bin/tsserver"
  ln -s "$out/lib/node_modules/typescript/bin/tsserver" "$out/lib/node_modules/.bin/tsserver"
  ln -s "$out/lib/node_modules/.bin" "$out/bin"
'')
