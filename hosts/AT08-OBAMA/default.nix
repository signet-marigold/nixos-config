{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./display-setup.nix
    ./modules/slstatus
    ./modules/networking.nix
    ./modules/open-ssh.nix
    ./modules/syncthing.nix
    ./modules/ai.nix
  ];
}
