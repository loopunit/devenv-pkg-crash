{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  stdenv = pkgs.gcc16Stdenv; # libcxxStdenv; # clangStdenv

  overlays = [
    (final: prev: {
      qpakman = final.callPackage ../packages/qpakman.nix { };
      wasted-hvcc = final.callPackage ../packages/wasted-hvcc.nix { };
    })
  ];

  packages = [
    pkgs.cmake
    pkgs.ninja
    pkgs.ceedling
    pkgs.sdl2-compat
    pkgs.mesa
    pkgs.libGL
    pkgs.libGLX
    pkgs.gdb
    pkgs.gdbgui
    pkgs.onetbb
    pkgs.embree
    pkgs.python3
    pkgs.pkg-config
    pkgs.graphviz
    pkgs.doxygen
    pkgs.fteqcc
    pkgs.qpakman
    pkgs.wasted-hvcc
  ];

  languages.python.enable = true;
  languages.c.enable = true;
  languages.cplusplus.enable = true;

  env = {
    # Ninja is faster than Make and is what CMakePresets.json assumes.
    # Only applies to freshly configured build directories.
    CMAKE_GENERATOR = "Ninja";
    # Generated per build dir; the top-level symlink is what clangd reads.
    CMAKE_EXPORT_COMPILE_COMMANDS = "ON";
  };
}
