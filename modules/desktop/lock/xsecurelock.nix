{ pkgs, ... }:

{
  services.xserver.xautolock = {
    enable = true;

    # Time idle to lock (in minutes)
    time = 15;

    locker    = "${pkgs.xsecurelock}/bin/xsecurelock";
    nowlocker = "${pkgs.xsecurelock}/bin/xsecurelock"; # executed with -nowlock flag

    enableNotifier = true;
    # Time before lock to notify (in seconds)
    notify = 15;
    notifier = "${pkgs.dunst}/bin/dunstify 'Locking session' 'Locking in 15 seconds' --timeout=5000 --urgency=critical --appname=xautolock";
  };

  environment.systemPackages = with pkgs; [
    xsecurelock
  ];
}
