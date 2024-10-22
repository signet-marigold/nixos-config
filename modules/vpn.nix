{ config, ... }:
{
  sops.secrets.pia-username = { };
  sops.secrets.pia-password = { };

  # This Mumbo Jumbo with "buildins.pathExist" a workaround for the first time nixos install
  # See we are trying to read from a file that *Will* exist after the sops module has been loaded and setup
  # Obviously the path won't resolve until after the first rebuild
  # So we will check IF that path exists THEN read it's contents

  services.pia = {
    enable = builtins.pathExists config.sops.secrets.pia-username.path;
    # Still waiting on a fix for 312283; https://github.com/NixOS/nixpkgs/issues/312283
    # Will probably through a warning about "pure eval mode" and have to be run with '--impure'
    authUserPass.username = if builtins.pathExists (config.sops.secrets.pia-username.path) then (builtins.readFile config.sops.secrets.pia-username.path) else "";
    authUserPass.password = if builtins.pathExists (config.sops.secrets.pia-password.path) then (builtins.readFile config.sops.secrets.pia-password.path) else "";
  };
}
