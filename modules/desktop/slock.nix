{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    slock
  ];

  systemd.user.services.slock = {
    description = "Suckless Lock";
    wantedBy = [ "suspend.target" ];
    serviceConfig = {
      User = "anhack";
      Environment = "DISPLAY=:0";
      ExecStart = "${pkgs.slock}/bin/slock";
      RestartSec = 3;
      Restart = "always";
    };
  };
}
