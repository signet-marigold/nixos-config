{ pkgs, ... }:

{
  security.polkit.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.ktexteditor
    kdePackages.kate
  ];
}

