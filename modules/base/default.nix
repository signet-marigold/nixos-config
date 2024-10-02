{
  imports = [
    #./auto-upgrade.nix # Runs reload script starting in -> /etc/nixos
    ./bootloader.nix
    ./garbage-collection.nix
    ./internationalisation.nix
    ./linux-kernel.nix
    ./nix-settings.nix
    ./nixpkgs.nix
    ./time.nix
  ];
}
