{ pkgs, ... }:
let
  hhst-volume    = pkgs.writeShellScriptBin "hhst-volume"    (builtins.readFile ./hhst-volume.sh);
  hhst-backlight = pkgs.writeShellScriptBin "hhst-backlight" (builtins.readFile ./hhst-backlight.sh);
in {
  environment.systemPackages = [
    hhst-volume
    hhst-backlight
  ];
}
