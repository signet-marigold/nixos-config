{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./display-setup.nix
    ./modules/slstatus
    #./modules/mac-randomize.nix dont know why but its failing now
    ./modules/networking.nix
    ./modules/open-ssh.nix
    #./modules/syncthing.nix
  ];
}
