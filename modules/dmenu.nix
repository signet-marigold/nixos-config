{ pkgs, ... }:

{
  # Install dynamic menu
  environment.systemPackages = with pkgs; [
    # Build package override
    (dmenu.overrideAttrs (oldAttrs: rec {
      # Build with custom config header file
      configFile = writeText "config.def.h" (builtins.readFile ../sl-headers/dmenu-config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";

      # buildInputs are packages required by one or more patches
      #buildInputs = oldAttrs.buildInputs ++ [ packagename ];
      patches = [
        #./dmenu-patches/dmenu-alpha-20230110-5.2.diff
        ./dmenu-patches/dmenu-border-20230512-0fe460d.diff
        ./dmenu-patches/dmenu-center-5.2.diff
        #./dmenu-patches/dmenu-fuzzyhighlight-caseinsensitive-4.9.diff
        ./dmenu-patches/dmenu-grid-4.9.diff
        ./dmenu-patches/dmenu-gridnav-5.2.diff
      ];
    }))
    # Require base package for system configuration
    dmenu
  ];
}
