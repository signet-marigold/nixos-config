{ pkgs, ... }:

{
  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%Y-%m-%d %H:%M:%S' --cmd dwm";
        user = "greeter";
      };
    };
  };

  #environment.systemPackages = with pkgs; [
  #  greetd.tuigreet
  #];
}
