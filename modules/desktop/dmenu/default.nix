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
        ./patches/dmenu-5.3-combinedpatch-20240801-anhack.diff
      ];
      # Inject custom config
      configFile = writeText "config.def.h" (builtins.readFile ./dmenu-config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
    }))

    dmenu
  ];

  # This fixes the 'dmenu lag after reboot' issue
  # Preload the path required by dmenu_run

  ## DOESNT ACTUALLY FIX ##
  ## DONT KNOW WHY ##
  # command runs as user but still lag from dmenu_run
  systemd.user.services."dmenu-path-load" = {
    description = "dmenu-path-load";
    script = ''
      ${pkgs.dmenu}/bin/dmenu_path
    '';
    wantedBy = [ "graphical-session.target" ]; # starts after login
  };
}

