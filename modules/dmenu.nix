{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Mod dmenu package
    (dmenu.overrideAttrs (oldAttrs: rec {
      # Lock version
      pname = "dmenu";
      version = "5.3";
      src = pkgs.fetchurl {
        url = "https://dl.suckless.org/tools/${pname}-${version}.tar.gz";
        hash = "sha256-Go9T5v0tdJg57IcMXiez4U2lw+6sv8uUXRWeHVQzeV8=";
      };
      # Apply patches
      patches = [
        #./dmenu-patches/dmenu-alpha-20230110-5.2.diff
        ./dmenu-patches/dmenu-border-20230512-0fe460d.diff
        ./dmenu-patches/dmenu-center-5.2.diff
        #./dmenu-patches/dmenu-fuzzyhighlight-caseinsensitive-4.9.diff
        ./dmenu-patches/dmenu-grid-4.9.diff
        ./dmenu-patches/dmenu-gridnav-5.2.diff
      ];
      # Inject custom config
      configFile = writeText "config.def.h" (builtins.readFile ../sl-headers/dmenu-config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
    }))

    dmenu
  ];
}
