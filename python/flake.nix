{
  description = "a description of your project flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };

      in with pkgs; {

        devShells.default = mkShell {
          packages = [
            stdenv.cc.cc.lib # required by Jupyter sometimes
            python3Packages.venvShellHook # autosetup venv

            #................. Python Packages here
            (python3.withPackages (p:
              with p;
              [
                pip
                # black
              ]))
          ];

          shellHook = ''
            echo "🛠️ Let's hack "
          '';

          venvDir = "./.venv";
          postVenvCreation = ''
            unset SOURCE_DATE_EPOCH
            #pip install -r requirements.txt
          '';
          postShellHook = ''
            unset SOURCE_DATE_EPOCH
          '';

        };

      });

}
