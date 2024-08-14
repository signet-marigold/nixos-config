{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./display-setup.nix
    ./modules/slstatus
    ./modules/mac-randomize.nix
    ./modules/networking.nix
    ./modules/open-ssh.nix
  ];
}
