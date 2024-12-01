{ pkgs, lib, ... }: let
  theme = {
    urgency_low = {
      background = "#222222e6"; # "#f7ca52"
      foreground = "#ddddddff"; # "#261f1e"
      border = "#334455ff";
    };
    urgency_normal = {
      background = "#222222e6"; # "#79cb31"
      foreground = "#ddddddff"; # "#222824"
      border = "#005577ff";
    };
    urgency_critical = {
      background = "#aa1144e6";
      foreground = "#ddddddff";
      border = "#444444ff";
    };
  };
in {
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = "32x32";
    };
    settings = {
      global = {
        #monitor = 0;
        follow = "keyboard";
        width = 300;
        height = 260;
        origin = "top-right";
        offset = "15x70";
        scale = 0;
        notification_limit = 10;
        progress_bar = "true";
        progress_bar_height = 12;
        progress_bar_frame_width = 2;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 2;
        icon_corner_radius = 4;
        indicate_hidden = "yes";
        transparency = 0;
        separator_height = 2;
        padding = 10;
        horizontal_padding = 18;
        text_icon_padding = 0;
        frame_width = 2;
        #frame_color = "#aaaaaa";
        gap_size = 4;
        #separator_color = "frame";
        sort = "yes";
        idle_threshold = 120;
        #font = "UbuntuMono Nerd Font Mono 17";
        line_height = 0;
        markup = "full";
        format = "<small><tt>[<u>%a</u>]</tt></small>\\n<b>%s</b> %p\\n<small>%b</small>";
        alignment = "left";
        vertical_alignment = "top";
        show_age_threshold = 60;
        word_wrap = "yes";
        ellipsize = "end";
        ignore_newline = "no";
        stack_duplicates = "true";
        hide_duplicate_count = "false";
        show_indicators = "yes";
        enable_recursive_icon_lookup = "true";
        #icon_theme = "breeze-dark, Papirus-Dark";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 48;
        #icon_path = "/usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/";
        sticky_history = "yes";
        history_length = 50;
        #dmenu = "/usr/bin/dmenu -p dunst";
        #browser = "/usr/bin/xdg-open";
        always_run_script = "true";
        title = "Dunst";
        class = "Dunst";
        corner_radius = 4;
        ignore_dbusclose = "false";
        force_xwayland = "false";
        force_xinerama = "false";
        mouse_left_click = "close_current";
        mouse_middle_click = "close_all";
        mouse_right_click = "do_action, close_current";
      };

      # Override stylix

      urgency_low = {
        background = lib.mkForce theme.urgency_low.background;
        foreground = lib.mkForce theme.urgency_low.foreground;
        frame_color = lib.mkForce theme.urgency_low.border;
        highlight = theme.urgency_low.foreground;
        timeout = 7;
      };

      urgency_normal = {
        background = lib.mkForce theme.urgency_normal.background;
        foreground = lib.mkForce theme.urgency_normal.foreground;
        frame_color = lib.mkForce theme.urgency_normal.border;
        highlight = theme.urgency_normal.foreground;
        timeout = 10;
      };

      urgency_critical = {
        background = lib.mkForce theme.urgency_critical.background;
        foreground = lib.mkForce theme.urgency_critical.foreground;
        frame_color = lib.mkForce theme.urgency_critical.border;
        highlight = theme.urgency_critical.foreground;
        timeout = 0;
      };
    };
  };
}
