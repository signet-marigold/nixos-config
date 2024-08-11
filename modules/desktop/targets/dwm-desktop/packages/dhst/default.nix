# Desktop Helper Scripts
#
# Smooths the desktop experience by providing trigger hooks into everyday utilities
# These scripts are set to keybinds in DWM's config.h file

{ pkgs, ... }:
let
  dhst-screenshot = pkgs.writeShellScriptBin "dhst-screenshot" (builtins.readFile ./screenshot.sh);
in {
  environment.systemPackages = [
    dhst-screenshot
  ];
}
