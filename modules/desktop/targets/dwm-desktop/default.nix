{
  # A compositor for transparency and other desktop effects
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = "drm";
    fade = true;
    fadeDelta = 2;
    fadeExclude = [
      "class_g = 'xsecurelock'"
    ];
    shadow = true;
    shadowOpacity = 0.35;
    shadowOffsets = [ (-15) (-15) ];
    shadowExclude = [
      "name = 'cpt_frame_xcb_window'"
      "class_g ?= 'zoom'"
    ];
    wintypes = {
      # popup_menu = { opacity = config.services.picom.menuOpacity; };
      # dropdown_menu = { opacity = config.services.picom.menuOpacity; };
      # menu        = { shadow = false; };
      dropdown_menu = { shadow = false; };
      popup_menu    = { shadow = false; };
      utility       = { shadow = false; };
    };
  };

  imports = [
    ../../dwm
    ../../dmenu
    ../../st
    ../../login/lightgreet.nix
    ../../lock/xsecurelock.nix
    ../../conky.nix
    ../../auto-cpufreq.nix
    ./packages/dhst
    ./packages/hhst
  ];
}
