{ pkgs ? import <nixpkgs> { } }:

with pkgs;

mkShell {
  buildInputs = [

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

  venvDir = "./.venv";
  postVenvCreation = ''
    unset SOURCE_DATE_EPOCH
    #pip install -r requirements.txt
  '';

  postShellHook = ''
    unset SOURCE_DATE_EPOCH
  '';
  shellHook = "";

}
