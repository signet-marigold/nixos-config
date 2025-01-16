{ pkgs, ... }:
{
  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    jetbrains-mono
    nerd-font-patcher
    (pkgs.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "Hack" "DejaVuSansMono" "Noto" ]; })
    hackgen-nf-font
  ];
}
