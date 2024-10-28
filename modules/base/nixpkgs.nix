{ nixpkgs-unstable, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Override packages
  # nixpkgs.config.packageOverrides = pkgs: {
  #   nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
  #     inherit pkgs;
  #   };
  # };

  # https://discourse.nixos.org/t/how-to-use-nixos-unstable-for-some-packages-only/36337
  # when installing packages it’s then possible to use `pkgs.unstable.rustc`
  nixpkgs.overlays = [
    (final: prev: {
      unstable = import nixpkgs-unstable {
        system = prev.system;
        config.allowUnfree = true;
      };
    })
  ];
}
