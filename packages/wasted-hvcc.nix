{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication {
  pname = "wasted-hvcc";
  version = "0.17.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Wasted-Audio";
    repo = "hvcc";
    rev = "535047f36423a07c2086294a1aadfa91ca10b492";
    hash = "sha256-pPpZYxjSCXvJ4p+65Rj292BT1KYJYYEFSp4f/UBmUnY=";
  };

  dependencies = with python3.pkgs; [
    arpeggio
    importlib-resources
    poetry-core
    pydantic
    pydantic-extra-types
    jinja2
  ];

  doCheck = false;

  meta = {
    homepage = "https://wasted-audio.github.io/hvcc/";
    description = "The heavy compiler collection for Pure Data patches.";
    license = lib.licenses.gpl3;
    mainProgram = "hvcc";
  };
}
