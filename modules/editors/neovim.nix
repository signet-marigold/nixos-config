{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #nvim.defaultPackage.${pkgs.system}
    neovim
    ranger
  ];
}
