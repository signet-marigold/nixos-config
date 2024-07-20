#
# DOESN'T WORK// BIG BROKEE
#


{ pkgs, ... }:

{
  # Install dwm blocks
  environment.systemPackages = with pkgs; [
    # Require base package for system configuration
    dwmblocks

    (dwmblocks.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "ashish-yadav11";
        repo = "dwmblocks";
        rev = "ee856541a77a204ba1a17fb8233340471c1ff0cc";
        hash = "sha256-1pbwp03KRK6HKH2eP+KHT+P0/NqE8wQaOEv5nuP5l48=";
      };

      # Make sure you include whatever dependencies the fork needs to build properly!
      buildInputs = oldAttrs.buildInputs ++ [
        pkg-config
        gnumake
        xorg.libX11
        xorg.libX11.dev
        xorg.libX11.dev.out
        xorg.libXft
        xorg.libXScrnSaver
      ];
      patches = [
        #./path/to/local.diff
      ];

      configFile = writeText "config.def.h" (builtins.readFile ../sls-headers/dwmblocks-config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
    }))
  ];
}
