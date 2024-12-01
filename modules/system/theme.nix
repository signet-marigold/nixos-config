{ pkgs, ... }: let
  #colors = "${pkgs.base16-schemes}/share/themes/horizon-dark.yaml";
  #colors = "${pkgs.base16-schemes}/share/themes/tomorrow.yaml";
  #colors = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
  #colors = "${pkgs.base16-schemes}/share/themes/tarot.yaml";
  #colors = "${pkgs.base16-schemes}/share/themes/shapeshifter.yaml";

  # Custom theme
  colors = {
    base00 = "191919"; # ----- Background
    base01 = "2c2e30"; # ----
    base02 = "424b54"; # ---
    base03 = "646d75"; # --
    base04 = "919aa3"; # ++
    base05 = "b2bcc4"; # +++
    base06 = "cdccce"; # ++++
    base07 = "e9e8e8"; # +++++ Foreground
    base08 = "c85b56"; # Red
    base09 = "f59a66"; # Orange
    base0A = "f5ca66"; # Yellow
    base0B = "22c95c"; # Green
    base0C = "49a796"; # Cyan
    base0D = "3c80b4"; # Blue
    base0E = "ca65cd"; # Magenta
    base0F = "a3572e"; # Brown
  };

  #base08 = "d85052";
  #base09 = "ff8c35";
  #base0A = "bec450";
  #base0B = "51ba55";
  #base0C = "4ccecc";
  #base0D = "5096d8";
  #base0E = "d87db4";
  #base0F = "ad5b49";

  #colors = {
  #  base00 = "222222";
  #  base01 = "333333";
  #  base02 = "444444";
  #  base03 = "666666";
  #  base04 = "999999";
  #  base05 = "bbbbbb";
  #  base06 = "cccccc";
  #  base07 = "eeeeee";
  #  base08 = "a72f2d";
  #  base09 = "9b440a";
  #  base0A = "c2c020";
  #  base0B = "0a9b57";
  #  base0C = "0a969b";
  #  base0D = "005577";
  #  base0E = "a615b9";
  #  base0F = "9b0a62";
  #};

  #wallpaper = config.lib.stylix.pixel "base00";
  wallpaper = ../../wallpapers/background_black.png;
in {
  stylix = {
    enable = true;
    polarity = "dark";
    image = wallpaper;
    base16Scheme = colors;
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
      colors.base00
      colors.base01
      colors.base02
      colors.base03
      colors.base04
      colors.base05
      colors.base06
      colors.base07
      colors.base08
      colors.base09
      colors.base0A
      colors.base0B
      colors.base0C
      colors.base0D
      colors.base0E
      colors.base0F
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

  #environment.systemPackages = with pkgs; [
    #faba-icon-theme
  #];
}
