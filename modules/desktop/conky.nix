{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    conky
  ];

  # Set service to start conky on x init
  #systemd.user.services.conky = {
  #  description = "Suckless Status";
  #  wantedBy = [ "graphical-session.target" ];
  #  partOf = [ "graphical-session.target" ];
  #  serviceConfig = {
  #    ExecStart = "${pkgs.conky}/bin/conky";
  #    ExecStop = "killall conky";
  #    RestartSec = 3;
  #    Restart = "always";
  #  };
  #};
}
