{ pkgs, lib, config, inputs, ... }:

let
  pkgs-unstable =
    import inputs.nixpkgs-unstable { system = pkgs.stdenv.system; };

in {
  env.GREET = "devenv";
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  enterShell = ''
    echo "🛠️ Let's hack 💻"
  '';

  packages = [
    pkgs.hello
    #config.languages.python.package.pkgs.pip
  ];

  languages.python = {
    enable = true;
    version = "3.12";
    venv.enable = true;
  };

  languages.python.uv = {
    package = pkgs-unstable.uv;
    enable = true;
    sync.enable = true;
    sync.extras = [ ];
  };

  difftastic.enable = true;
  dotenv.enable = false;

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
  '';

  # https://devenv.sh/pre-commit-hooks/

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };
}
