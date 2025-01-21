{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    #shortcut = "a";
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;
    clock24 = true;
    keyMode = "vi";

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
      # remap prefix from 'C-b' to 'C-a'
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix

      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      # Mouse works as expected
      set-option -g mouse on

      # easy-to-remember split pane commands
      bind '\' split-window -h -c "#{pane_current_path}"
      bind '-' split-window -v -c "#{pane_current_path}"
      bind 'c' new-window -c "#{pane_current_path}"

      # switch panes using Alt-arrow without prefix
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # don't rename windows automatically
      set-option -g allow-rename off


      # DESIGN TWEAKS

      # don't do anything when a 'bell' rings
      set -g visual-activity off
      set -g visual-bell off
      set -g visual-silence off
      setw -g monitor-activity off
      set -g bell-action none

      # clock mode
      setw -g clock-mode-colour colour1

      # copy mode
      setw -g mode-style 'fg=colour1 bg=colour18 bold'

      # pane borders
      set -g pane-border-style 'fg=colour1'
      set -g pane-active-border-style 'fg=colour3'

      # statusbar
      set -g status-position bottom
      set -g status-justify left
      set -g status-style 'fg=colour1'
      set -g status-left '\'
      set -g status-right '%Y-%m-%d %H:%M '
      set -g status-right-length 50
      set -g status-left-length 10

      setw -g window-status-current-style 'fg=colour0 bg=colour1 bold'
      setw -g window-status-current-format ' #I #W #F '

      setw -g window-status-style 'fg=colour1 dim'
      setw -g window-status-format ' #I #[fg=colour7]#W #[fg=colour1]#F '

      setw -g window-status-bell-style 'fg=colour2 bg=colour1 bold'

      # messages
      set -g message-style 'fg=colour2 bg=colour0 bold'
    '';
  };
}
