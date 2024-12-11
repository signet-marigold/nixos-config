{
  # OpenVPN 1194/UDP 1198/UDP

  # Tauon web play: 7590/TCP

  # Syncthing ports: 8384 for remote access to GUI
  # 22000 TCP and/or UDP for sync traffic
  # 21027/UDP for discovery
  # source: https://docs.syncthing.net/users/firewall.html

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 7590 22000 ];
  networking.firewall.allowedUDPPorts = [ 1194 1198 1500 22000 21027 ];
}
