{ pkgs, ... }:

{
  # Custom dwm package
  nixpkgs.overlays = [
    (final: prev: {
      dwm = prev.dwm.overrideAttrs (old: {
        src = ./dwm-flexipatch-8a3da06;
        # imlib2 used in icon patch
        buildInputs = old.buildInputs ++ [ pkgs.imlib2 ];
      });
    })
  ];

  # src = pkgs.fetchFromGithub {
  #  repo = "repo";
  #  owner = "owner";
  #  version = "...";
  #  rev = "...";
  #  hash = "";
  #};

  # Enable dwm
  services.xserver = {
    enable = true;
    autorun = true;
    windowManager.dwm.enable = true;
  };

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

    #paperview  # wallpaper setting
  ];
}
