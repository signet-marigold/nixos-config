{ ... }:

{
  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.blueman.enable = true;

  # Logitech Wireless
  hardware.logitech.wireless.enable = true;
}
