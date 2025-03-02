{
  inputs = {
    nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
    systems.url = "github:nix-systems/default";
    devenv.url = "github:cachix/devenv";
    devenv.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-python.url = "github:cachix/nixpkgs-python";
    nixpkgs-python.inputs = { nixpkgs.follows = "nixpkgs"; };
  };

  nixConfig = {
    extra-trusted-public-keys =
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = { self, nixpkgs, devenv, systems, ... }@inputs:

    let forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in {
      packages = forEachSystem (system: {
        devenv-up = self.devShells.${system}.default.config.procfileScript;
        devenv-test = self.devShells.${system}.default.config.test;
      });

      devShells = forEachSystem (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = devenv.lib.mkShell {
            inherit inputs pkgs;

            #[..................Our Main Config................
            modules = [{

              packages = [
                pkgs.hello
                # config.languages.python.package.pkgs.sample_py_package
              ];

              # starship.enable = true; #in case you donot have a pretty terminal prompt by default

              languages.python = {
                enable = true;
                version = "3.12";
              };

              languages.python.poetry = {
                enable = true;
                install.verbosity = "more";
                install.enable = true;
                activate.enable = true;
                install.allExtras = true;
              };

              processes.hello.exec = "hello";
              enterShell = ''
                echo "🛠️ Let's hack 💻"
              '';

              difftastic.enable = true;
              dotenv.enable = true;

              # https://devenv.sh/pre-commit-hooks/
              pre-commit.hooks = {
                black.enable = true;
                nixfmt.enable = true;
                editorconfig-checker.enable = true;
              };

            }];

            #................................................]

          };
        });
    };
}
