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

  environment.systemPackages = with pkgs; [
    # Extra packages that are dwm specific or closely related
    arandr     # gui monitor settings
    #paperview  # wallpaper setting
  ];
}
