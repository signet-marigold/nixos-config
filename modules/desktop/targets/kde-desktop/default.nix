{ pkgs, lib, ... }:
{
  # Enable KDE
  services.xserver.enable = true;
  services.displayManager.sddm.enable = lib.mkForce true;
  services.desktopManager.plasma6.enable = true;

  #environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #  plasma-browser-integration
  #  konsole
  #  oxygen
  #];
}
