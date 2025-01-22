{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #kdePackages.ktexteditor
    kdePackages.kate
  ];
}
