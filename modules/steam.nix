{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;      # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  hardware.steam-hardware.enable = true; # Enable controller drivers
  hardware.xone.enable = true;           # Enable xbox controller dongle drivers
}
