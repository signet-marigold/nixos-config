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

    virtualbox
    distrobox

    qemu

    podman-compose
    podman-tui

    # lazydocker
    # docker-credential-helpers

    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
  ];

  # libvirtd & Virt-manager
  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  # Authorized users
  users.groups.libvirtd.members = [ "anhack" ];

  services.spice-vdagentd.enable = true;
}
