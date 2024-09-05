{ config, pkgs, inputs, agenix, ... }:

{
  environment.systemPackages = with pkgs; [
    agenix.packages.${pkgs.system}.default
  ];
}
