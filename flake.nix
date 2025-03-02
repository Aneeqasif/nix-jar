{
  description = "A collection of Nix flake templates";

  outputs = { self }: {
    templates = {
      pydev = {
        path = ./pydevenv;
        description = "Python development environment using devenv and flakes";
      };

      # Template for pyflake
      pyflake = {
        path = ./python;
        description = "Basic Python project template with flake support";
      };

      # Template for pyflake
      uvdev = {
        path = ./uvdev;
        description = "devenv environment with uv";
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
    defaultTemplate = self.templates.pydev;
  };
}
