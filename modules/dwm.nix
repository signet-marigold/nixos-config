{ pkgs, ... }:

{
  # Enable dwm
  services.xserver = {
    enable = true;
    autorun = true;
    windowManager.dwm = {
      enable = true;
    };

    # Enable light desktop manager (just for login)
    displayManager = {
      lightdm = {
        enable = true;
        autoLogin.timeout = 3;
        greeter.enable = true;
      };
    };
  };

  # Mod dwm package
  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (oldAttrs: rec {
        # Lock version
        pname = "dwm";
        version = "6.5";
        src = pkgs.fetchurl {
          url = "https://dl.suckless.org/dwm/${pname}-${version}.tar.gz";
          hash = "sha256-Ideev6ny+5MUGDbCZmy4H0eExp1k5/GyNS+blwuglyk=";
        };
        # Apply patches
        patches = [
          ./dwm-patches/dwm-alpha-20230401-348f655.diff
          #./dwm-patches/dwm-systray-20230922-9f88553.diff
        ];
        # Inject custom config
        configFile = super.writeText "config.h" (builtins.readFile ../sl-headers/dwm-config.h);
        postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
      });
    })
  ];

  # Enable autologin
  services.displayManager = {
    autoLogin.enable = false;
    autoLogin.user = "anhack";
  };

  environment.systemPackages = with pkgs; [
    dwm

    # Extra packages tied to dwm (or tiling desktops in general)
    acpilight  # Backlight control (xbacklight)
    pulseaudio # Volume control (pactl)

    arandr     # gui monitor settings
    qutebrowser
  ];

  # Inject custom scripts for managing hardware controls (screen brightness, volume, etc.)
  #import = [ ../packages/hhst.nix ];
}
