{ config, pkgs, inputs, nvim, ... }:

{
  environment.systemPackages = with pkgs; [
    nvim.defaultPackage.${pkgs.system}
  ];
}
