{ pkgs, ... }:
{
  # When connecting to untrusted networks, such as public Wi-Fi use a random MAC address to prevent tracking and unauthorized access to your device.
  # But my recommendation is to avoid untrusted networks whenever possible, opting for trusted home or mobile hotspot connections.
  # Also, you can enhance your privacy and security by:
    # - Employing a VPN (Virtual Private Network) to encrypt internet traffic.
    # - Utilizing Encrypted DNS, with DNS over HTTPS (DoH) to encrypt communication with the DNS server and mask DNS traffic under HTTPS.

  environment.systemPackages = with pkgs; [
    macchanger
  ];

  # Enable MAC Randomize
  systemd.services.macchanger = {
    enable = true;
    description = "Change MAC address";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.macchanger}/bin/macchanger -r wlp3s0";
      ExecStop = "${pkgs.macchanger}/bin/macchanger -p wlp3s0";
      RemainAfterExit = true;
    };
  };
}
