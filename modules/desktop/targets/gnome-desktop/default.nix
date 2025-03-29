{ pkgs, lib, ... }:
{
  # Enable Gnome
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = lib.mkForce true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-connections
    gnome-characters
    gnome-contacts
    gnome-music
    gnome-terminal
    gnome-tour
    atomix # puzzle game
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    geary # email reader
    gedit # text editor
    hitori # sudoku game
    iagno # go game
    tali # poker game
    totem # video player
  ]);

  imports = [
    ../../st
  ];
}
