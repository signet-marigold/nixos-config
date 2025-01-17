{ config, lib, pkgs, ... }:
{
  networking.networkmanager.pia-vpn.enable = true;
  networking.networkmanager.pia-vpn.usernameFile = config.sops.secrets."pia_vpn_username".path;
  networking.networkmanager.pia-vpn.passwordFile = config.sops.secrets."pia_vpn_password".path;
  networking.networkmanager.pia-vpn.serverList =
    [ "denmark" "fi" "nl-amsterdam" "no" "sweden" "uk-london" "us-newyorkcity" ];

  sops.secrets."pia_vpn_username" = {};
  sops.secrets."pia_vpn_password" = {};
}
