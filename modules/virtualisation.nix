{ pkgs, ... }:

{
  # Enable Containerd
  # virtualisation.containerd.enable = true;

  # Enable Docker
  # virtualisation.docker.enable = true;
  # virtualisation.docker.rootless = {
  #   enable = true;
  #   setSocketVariable = true;
  # };
  # users.extraGroups.docker.members = [ "anhack" ];

  # Enable Podman
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # nerdctl

    # firecracker
    # firectl
    # flintlock

    distrobox
    qemu

    podman-compose
    podman-tui

    # lazydocker
    # docker-credential-helpers

    # virtualbox
  ];

  # Virt Manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # VirtualBox
  #virtualisation.virtualbox.host.enable = true;
  #virtualisation.virtualbox.host.enableExtensionPack = true;

  # Settings if this host is running as a guest inside virtualbox
  #virtualisation.virtualbox.guest.enable = true;
  #virtualisation.virtualbox.guest.draganddrop = true;
}
