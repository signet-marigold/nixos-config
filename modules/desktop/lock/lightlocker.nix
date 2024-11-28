{ pkgs, ... }:

{
  services.xserver.xautolock.enable = true;

  environment.systemPackages = with pkgs; [
    lightlocker
  ];

  systemd.user.services.lightlocker = {
    description = "LightDM Lock";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.lightlocker}/bin/light-locker";
      RestartSec = 3;
      Restart = "always";
    };
  };
}
