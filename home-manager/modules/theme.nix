{ pkgs, lib, ... }:

{
  # Default icon pack for gtk
  gtk.enable = true;
  gtk.iconTheme.package = lib.mkForce pkgs.papirus-icon-theme;
  gtk.iconTheme.name = lib.mkForce "Papirus-Dark";
}
