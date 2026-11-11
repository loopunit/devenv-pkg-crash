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
      ericw-tools = final.callPackage ../packages/ericw-tools.nix { };
      wasted-hvcc = final.callPackage ../packages/wasted-hvcc.nix { };
    })
  ];

  packages = [
    pkgs.fteqcc
    pkgs.qpakman
    pkgs.python3
    pkgs.ericw-tools
    pkgs.wasted-hvcc
  ];

  languages.python.enable = true;
}
