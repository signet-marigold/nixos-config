{ pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    jetbrains-mono
    nerd-font-patcher
  ];
}
