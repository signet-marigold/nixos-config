{ pkgs, ... }:

{
  home.username = "anhack";
  home.homeDirectory = "/home/anhack";
  home.stateVersion = "24.11";

  programs = {
    home-manager.enable = true;

    fish = {
      enable = true;
      shellAbbrs = {
        displays = "arandr";
        bluetooth = "blueman-manager";
        sound = "pavucontrol";
      };
    };

    git = {
      enable = true;
      userName = "Alex Hack";
      userEmail = "perad@sqwu.me";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
        credential = {
          helper = "store";
        };
        pull = {
          rebase = true;
        };
      };
    };
    gitui.enable = true;
    lazygit.enable = true;

    qutebrowser = {
      enable = true;
      extraConfig = ''
        c.tabs.padding = {'top': 2, 'bottom': 4, 'right': 0, 'left': 0}
      '';
    };
  };

  services.dunst.enable = true;

  #imports = [ ./modules/firefox.nix ];
}
