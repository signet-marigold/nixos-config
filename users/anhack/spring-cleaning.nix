{ pkgs, ... }:

{
  systemd.timers."clean-downloads" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "clean-downloads.service";
    };
  };
  systemd.timers."clean-trash" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unit = "clean-trash.service";
    };
  };

  # Move files modified older than 3 days into trash
  systemd.services."clean-downloads" = {
    script = ''
      set -eu
      if [ -d "/home/anhack/Downloads/" ]; then
        ${pkgs.coreutils}/bin/mkdir -p /home/anhack/.trash/
        ${pkgs.findutils}/bin/find /home/anhack/Downloads/* -mtime +3 -exec ${pkgs.coreutils}/bin/mv "{}" /home/anhack/.trash/ \;
      fi
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
  # Delete files last change older than 15 days from trash
  systemd.services."clean-trash" = {
    script = ''
      set -eu
      if [ -d "/home/anhack/.trash/" ]; then
        ${pkgs.findutils}/bin/find /home/anhack/.trash/* -ctime +15 -exec ${pkgs.coreutils}/bin/rm -r "{}" \;
      fi
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}

