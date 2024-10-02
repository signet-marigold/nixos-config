{ pkgs, config, ... }:
let
  #theme = "${pkgs.base16-schemes}/share/themes/horizon-dark.yaml";
  #theme = "${pkgs.base16-schemes}/share/themes/tomorrow.yaml";
  #theme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
  #theme = "${pkgs.base16-schemes}/share/themes/tarot.yaml";
  #theme = "${pkgs.base16-schemes}/share/themes/shapeshifter.yaml";

  # Custom theme
  theme = {
    base00 = "212121";
    base01 = "323537";
    base02 = "3f4448";
    base03 = "515960";
    base04 = "98969d";
    base05 = "b2b1b5";
    base06 = "cdccce";
    base07 = "e9e8e8";
    base08 = "d85052";
    base09 = "ff8c35";
    base0A = "bec450"; #"ccd345";
    base0B = "51ba55"; #"35d83a";
    base0C = "4ccecc";
    base0D = "5096d8"; #"8c73ff";
    base0E = "d87db4"; #"d850a2";
    base0F = "ad5b49";
  };

  #theme = {
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
      theme.base00
      theme.base01
      theme.base02
      theme.base03
      theme.base04
      theme.base05
      theme.base06
      theme.base07
      theme.base08
      theme.base09
      theme.base0A
      theme.base0B
      theme.base0C
      theme.base0D
      theme.base0E
      theme.base0F
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
