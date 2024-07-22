{ pkgs, ... }:

{
  # Enable DWM
  services.xserver = {
    enable = true;
    autorun = true;
    #layout = "no";
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

  # Overlay patches and config header on top of dwm package
  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (oldAttrs: rec {
        # Apply patches
        patches = [
          ./dwm-patches/dwm-alpha-20230401-348f655.diff
        ];
        # Inject custom c header
        configFile = super.writeText "config.h" (builtins.readFile ../sls-headers/dwm-config.h);
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
    # Require base package for system configuration
    dwm

    # Extra packages tied to dwm (or tiling desktops in general)
    acpilight  # Backlight control (xbacklight)
    pulseaudio # Volume control (pactl)
    arandr     # gui monitor settings
    qutebrowser
  ];
}
