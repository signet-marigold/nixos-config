{ config, ... }:
{
  sops.secrets = {
    pia-username = { };
    pia-password = { };
  };
  services.pia = {
    enable = true;
    # Still waiting on a fix for 312283; https://github.com/NixOS/nixpkgs/issues/312283
    # Will probably through a warning about "pure eval mode" and have to be run with '--impure'
    authUserPass.username = builtins.readFile config.sops.secrets.pia-username.path;
    authUserPass.password = builtins.readFile config.sops.secrets.pia-password.path;
  };
}
