#
#  This will create two systemd timers that will periodically move
#  files from the Downloads folder to a trash folder.
#  Old files from the trash folder will be auto deleted after some time.
#
#  18 days after a new file is downloaded, if not moved, that file will be deleted
#

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

  # Move files into trash if last modified date is more than 3 days ago
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
  # Delete files from trash if last changed date is more than 15 days ago
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

