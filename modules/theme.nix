{ pkgs, config, ... }:
let
  theme = "${pkgs.base16-schemes}/share/themes/horizon-dark.yaml";
in {
  stylix = {
    enable = true;
    image = config.lib.stylix.pixel "base00";
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

  # Override packages
  nixpkgs.config.packageOverrides = pkgs: {
    discord = pkgs.discord.override {
      withOpenASAR = true;
      withTTS = true;
    };
  };
}
