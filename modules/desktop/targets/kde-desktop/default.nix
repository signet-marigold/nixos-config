{ pkgs, lib, ... }:
{
  # Enable KDE
  services.xserver.enable = true;
  services.displayManager.sddm.enable = lib.mkForce true;
  services.desktopManager.plasma6.enable = true;

  # Run everything in wayland
  services.displayManager.defaultSession = "plasma";

  # Launch SDDM in Wayland too
  services.displayManager.sddm.wayland.enable = true;
}
