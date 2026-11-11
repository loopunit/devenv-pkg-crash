{
  lib,
  stdenv,
  fetchFromGitHub,
  pkg-config,
  cmake,
  libpng,
  zlib,
}:
stdenv.mkDerivation {
  pname = "qpakman";
  version = "auto-build-27226454123";

  src = fetchFromGitHub {
    owner = "LibreQuake";
    repo = "qpakman";
    rev = "36035bde8512a9ad99e81fe4cab4f47adbaad34c";
    hash = "sha256-xJdInWW1D27iOECBoJpeaNs+5hh5t8ZltqOKAfxDWWM=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    libpng
    zlib
  ];

  meta = with lib; {
    homepage = "https://github.com/fhomolka/qpakman";
    description = "command-line tool for managing PAK and WAD files from QuakeI/II & Hexen II";
    license = licenses.gpl2Plus;
    maintainers = [ ];
    platforms = platforms.unix;
    mainProgram = "qpakman";
  };
}
