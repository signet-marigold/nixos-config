# Hardware Helper Scripts
#
# Provides necessary tools to comunicate with hardware devices on DWM
# These scripts are set to keybinds in DWM's config.h file

{ pkgs, ... }:
let
  hhst-volume    = pkgs.writeShellScriptBin "hhst-volume"    (builtins.readFile ./volume.sh);
  hhst-backlight = pkgs.writeShellScriptBin "hhst-backlight" (builtins.readFile ./backlight.sh);
in {
  environment.systemPackages = [
    hhst-volume
    hhst-backlight
  ];
}
