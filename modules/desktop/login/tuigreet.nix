{ pkgs, inputs, ... }: let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  dwm-session = "${pkgs.dwm}/share/xsessions";
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        #command = "${tuigreet} --time --time-format '%Y-%m-%d %H:%M:%S' --remember --remember-session --sessions ${dwm-session}";
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd dwm";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
