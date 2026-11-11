{
  lib,
  stdenv,
  fetchFromGitHub,
  gtest,
  fmt,
  cmake,
  onetbb,
  embree,
  python3,
  git,
  libllvm,
  installShellFiles,
}:
stdenv.mkDerivation rec {
  pname = "ericw-tools";
  version = "0.18.2";

  googletest = fetchFromGitHub {
    owner = "google";
    repo = "googletest";
    rev = "f8d7d77c06936315286eb55f8de22cd23c188571";
    sha256 = "sha256-t0RchAHTJbuI5YW4uyBPykTvcjy90JW9AOPNjIhwh6U=";
    fetchSubmodules = true;
  };

  src = fetchFromGitHub {
    #owner = "ericwa";
    #repo = "ericw-tools";
    #rev = "36eec1da2a194467e6baac2f444c2dd04b57d266";
    #sha256 = "sha256-Xfhz3PBBtpHGgMrMPJqK/14jxv1H3KHmwrWJaVUiwcc=";

    owner = "auto-pigeon";
    repo = "ericw-tools";
    rev = "b7c04a5bc2a195f4317e3c900ad4d8360a319861";
    sha256 = "sha256-jSLgb5e1Mz/2oOpnqj4e67o7EYQbsvLiSXjcLLOesMs=";
    fetchSubmodules = true;
  };

  postUnpack = ''
    pushd source/3rdparty
    ln -s ${fmt.src} fmt
    ln -s ${gtest.src} googletest
    popd
  '';

  nativeBuildInputs = [
    cmake
    installShellFiles
    onetbb
    embree
    python3
    git
    libllvm
  ];

  cmakeFlags = [
    "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
    "-DENABLE_LIGHTPREVIEW=OFF"
    "-DDISABLE_DOCS=ON"
    "-DDISABLE_TESTS=ON"
    "-DSKIP_TBB_INSTALL=ON"
    "-DSKIP_EMBREE_INSTALL=ON"
    "-DFETCHCONTENT_SOURCE_DIR_GOOGLETEST=${googletest}"
  ];

  outputs = [
    "out"
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    for TOOL in bspinfo bsputil light qbsp vis ; do
      cp -a $TOOL/$TOOL $out/bin/
    done

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://ericwa.github.io/ericw-tools/";
    description = "Map compile tools for Quake and Hexen 2";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ astro ];
  };
}
