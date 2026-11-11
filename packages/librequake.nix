{
  lib,
  stdenv,
  fetchFromGitHub,
  fteqcc,
  qpakman,
  python3,
  ericw-tools,
}:
stdenv.mkDerivation {
  pname = "librequake";
  version = "0.09-beta";

  src = fetchFromGitHub {
    owner = "lavenderdotpet";
    repo = "LibreQuake";
    rev = "dd4d5bffcabbcf9ceca32a1d83829109928c3f08";
    hash = "sha256-nmUmdfyas82u2BhQsmNuIvMaezHmsQxgi4NPLDKKeHs=";
  };

  nativeBuildInputs = [
    fteqcc
    qpakman
    python3
    ericw-tools
  ];

  buildInputs = [
  ];

  buildPhase = ''
    python build.py
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -a releases/full/id1 $out/

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://librequake.queer.sh/";
    description = "The *LibreQuake* project aims to create a complete, free content first-person shooter game, but *LibreQuake* by itself is just the raw material for a game. It must be paired with a compatible engine to be played.";
    license = licenses.gpl2Plus;
    maintainers = [ ];
    platforms = platforms.unix;
  };
}
