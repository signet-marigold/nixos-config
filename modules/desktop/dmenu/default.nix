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
      # Dependencies
      buildInputs = oldAttrs.buildInputs ++ [ xorg.libX11 xorg.libXft xorg.libXinerama xorg.libXrender ];
      # Apply patches
      patches = [
        ./patches/dmenu-5.3-combinedpatch-20240801-anhack.diff
      ];
      # Inject custom config
      configFile = writeText "config.def.h" (builtins.readFile ./dmenu-config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";

      preConfigure = ''
        makeFlagsArray+=(
          PREFIX="$out"
          CC="$CC"
          # default config.mk hardcodes dependent libraries and include paths
          INCS="`$PKG_CONFIG --cflags fontconfig x11 xft xinerama xrender` -lm"
          LIBS="`$PKG_CONFIG --libs   fontconfig x11 xft xinerama xrender` -lm"
        )
      '';
    }))

    dmenu
  ];

  # This fixes the delay on first run of dmenu after reboot
  # Preload the path required by dmenu_run
  systemd.services."dmenu-precache" = {
    enable = true;
    description = "Preload dmenu cache";
    wantedBy = [ "multi-user.target" ];
    #partOf = [ "graphical-session.target" ];
    serviceConfig = {
      User = "anhack";
      ExecStart = "${pkgs.dmenu}/bin/dmenu_path";
      RestartSec = 3;
      Restart = "on-failure";
    };
  };
}

