{ pkgs, config, ... }:
let
  #theme = "${pkgs.base16-schemes}/share/themes/horizon-dark.yaml";
  #theme = "${pkgs.base16-schemes}/share/themes/tomorrow.yaml";
  #theme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
  theme = "${pkgs.base16-schemes}/share/themes/tarot.yaml";

  #wallpaper = config.lib.stylix.pixel "base00";
  wallpaper = ../../wallpapers/background.png;
in {
  stylix = {
    enable = true;
    #polarity = "dark";
    image = wallpaper;
    base16Scheme = theme;
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        popups = 12;
      };
    };
    cursor = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 24;
    };
  };

  qt.enable = true;
  qt.platformTheme = "gtk2";
  qt.style = "gtk2";

  console = {
    earlySetup = true;
    colors = [
      # colors pulled from `tomorrow-night`
      "1d1f21"
      "282a2e"
      "373b41"
      "969896"
      "b4b7b4"
      "c5c8c6"
      "e0e0e0"
      "ffffff"
      "cc6666"
      "de935f"
      "f0c674"
      "b5bd68"
      "8abeb7"
      "81a2be"
      "b294bb"
      "a3685a"
    ];
    #packages = [
    #  pkgs.terminus_font
    #  pkgs.powerline-fonts
    #];
    #font = "${pkgs.terminus_font}/share/consolefonts/ter-120n.psf.gz";
  };

    #  "24273a"
    #  "ed8796"
    #  "a6da95"
    #  "eed49f"
    #  "8aadf4"
    #  "f5bde6"
    #  "8bd5ca"
    #  "cad3f5"
    #  "5b6078"
    #  "ed8796"
    #  "a6da95"
    #  "eed49f"
    #  "8aadf4"
    #  "f5bde6"
    #  "8bd5ca"
    #  "a5adcb"

  # Override packages
  #nixpkgs.config.packageOverrides = pkgs: {
  #  discord = pkgs.discord.override {
  #    withOpenASAR = true;
  #    withTTS = true;
  #  };
  #};

  environment.systemPackages = with pkgs; [
    #faba-icon-theme
  ];
}
