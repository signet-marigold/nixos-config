{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "\${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    historyLimit = 100000;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
    '';
  };
}
