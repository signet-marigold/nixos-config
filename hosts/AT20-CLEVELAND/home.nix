{ ... }:

{
  home.username = "anhack";
  home.homeDirectory = "/home/anhack";
  home.stateVersion = "24.11";

  programs = {
    home-manager.enable = true;
  };
}
