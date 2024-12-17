{ pkgs, lib, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = lib.mkForce "Materia-dark";
      package = lib.mkForce pkgs.materia-theme;
    };
    iconTheme = {
      package = lib.mkForce pkgs.papirus-icon-theme;
      name = lib.mkForce "Papirus-Dark";
    };
  };
}
