{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libinput
  ];
}
