{ config, lib, ... }:
{
  # Extra options to try and fix no tty on desktop (prevents vertual console dm like tuigreet)
  # Nothing is working...
  #boot.kernelParams = [ "module_blacklist=amdgpu" ]; # blacklist integrated gpu
  boot.blacklistedKernelModules = [ "i915" "amdgpu" ];
  #nixpkgs.config.allowUnfree = pkgs.lib.mkForce true;
  #boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  #boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {

    #nvidiaPersistenced = true;

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    #powerManagement.finegrained = true;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    #package = config.boot.kernelPackages.nvidiaPackages.latest;

    # Pin nvidia module version
    # https://discourse.nixos.org/t/nvidia-565-77-wont-work-in-kernel-6-13/59234/10
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "570.86.16"; # use new 570 drivers
      sha256_64bit = "sha256-RWPqS7ZUJH9JEAWlfHLGdqrNlavhaR1xMyzs8lJhy9U=";
      openSha256 = "sha256-DuVNA63+pJ8IB7Tw2gM4HbwlOh1bcDg2AN2mbEU9VPE=";
      settingsSha256 = "sha256-9rtqh64TyhDF5fFAYiWl3oDHzKJqyOW3abpcf2iNRT8=";
      usePersistenced = false;
    };

    # Nvidia Optimus PRIME. It is a technology developed by Nvidia to optimize
    # the power consumption and performance of laptops equipped with their GPUs.
    # It seamlessly switches between the integrated graphics,
    # usually from Intel, for lightweight tasks to save power,
    # and the discrete Nvidia GPU for performance-intensive tasks.
    prime = {
      offload = {
        #enable = true;
        #enableOffloadCmd = true;
        enable = false;
        enableOffloadCmd = false;
      };

      # FIXME: Change the following values to the correct Bus ID values for your system!
      # More on "https://wiki.nixos.org/wiki/Nvidia#Configuring_Optimus_PRIME:_Bus_ID_Values_(Mandatory)"
      nvidiaBusId = "PCI:0:0:0";
      intelBusId = "PCI:0:0:0";
    };
  };

  # NixOS specialization named 'nvidia-sync'. Provides the ability
  # to switch the Nvidia Optimus Prime profile
  # to sync mode during the boot process, enhancing performance.
  specialisation = {
    nvidia-sync.configuration = {
      system.nixos.tags = [ "nvidia-sync" ];
      hardware.nvidia = {
        powerManagement.finegrained = lib.mkForce false;

        prime.offload.enable = lib.mkForce false;
        prime.offload.enableOffloadCmd = lib.mkForce false;

        prime.sync.enable = lib.mkForce true;
        # Dynamic Boost. It is a technology found in NVIDIA Max-Q design laptops with RTX GPUs.
        # It intelligently and automatically shifts power between
        # the CPU and GPU in real-time based on the workload of your game or application.
        dynamicBoost.enable = lib.mkForce true;
      };
    };
  };
}
