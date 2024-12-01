{ config, ... }:
{
  # Known issue with pia's certificates
  # Outlined here
  # https://forums.openvpn.net/viewtopic.php?t=33536
  # Basically openvpn needs to be downgraded or support aes-128-cbc

  sops.secrets.pia = { };
  services.pia = {
    enable = true;
    authUserPassFile = config.sops.secrets.pia.path;
  };
}
