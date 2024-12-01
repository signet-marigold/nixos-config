{ pkgs, ... }:
{
  services.xserver.displayManager.setupCommands = ''
    LEFT='HDMI-0'
    CENTER='DP-2'
    ${pkgs.xorg.xrandr}/bin/xrandr \
      --output $CENTER \
      --output $LEFT --left-of $CENTER
  '';
    # LEFT='DVI-D-0'
    # CENTER='DVI-I-1'
    # RIGHT='HDMI-A-0'
    # ${pkgs.xorg.xrandr}/bin/xrandr \
      # --output $CENTER --rotate left
      # --output $LEFT   --rotate left --left-of  $CENTER
      # --output $RIGHT  --rotate left --right-of $CENTER
}
