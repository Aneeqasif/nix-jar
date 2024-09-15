# Description of the project

This project hosts some flakes that I use often in my projects. I have created them to make my life easier and to make my projects more consistent. I hope they can help you too.

All flakes support multiple systems and have a consistent structure. They are easy to use and can be customized to your needs.

# Usage

For using basic flake just run following command in your project directory:

```bash
nix flake init -t github:aneeqasif/nix-jar
```

## python flake

A basic python flake

```bash
nix flake init -t github:aneeqasif/nix-jar/#python
```

## pydevenv flake

uses devenv with flakes very intersting stuff look at devenv.sh

```bash
nix flake init -t github:aneeqasif/nix-jar/#pydevenv
```

## default / basic flake

Just a basic flake

```sh
nix flake init -t github:aneeqasif/nix-jar/#basic
```

### basic shell.nix

Basic shell.nix file with python and venv shell hook support

```bash
nix flake init -t github:aneeqasif/nix-jar/#pyshell
```
