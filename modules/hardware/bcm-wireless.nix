{ config, ... }:
{
  # Load broadcom wireless driver
  boot.kernelModules = [ "wl" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ broadcom_sta ];

  # Blacklist similar modules to avoid collision
  boot.blacklistedKernelModules = [ "b43" "bcma" ];
}
