{
  description = "A collection of Nix flake templates";

  outputs = { self }: {
    templates = {
      devenvPyflake = {
        path = ./devenv-pyflake;
        description = "Python development environment using devenv and flakes";
      };

      # Template for pyflake
      pyflake = {
        path = ./pyflake;
        description = "Basic Python project template with flake support";
      };

      # Template basic
      basic = {
        path = ./basic;
        description = "Basic flake support";
      };

      # Template for pyshell
      pyshell = {
        path = ./pyshell;
        description = "Basic shell.nix for Python projects";
      };
    };

    # Set a default template (optional)
    defaultTemplate = self.templates.basic;
  };
}
