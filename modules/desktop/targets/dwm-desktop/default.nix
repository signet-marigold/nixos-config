{
  # A compositor for transparency and other desktop effects
  services.picom = {
    enable = true;
    # Fading settings
    fade = true;
    # on 60hz displays it doesn't make sense to have this faster than 16ms
    # i;m hoping there's interpolation otherwise animations would be demanding more than they'd need
    fadeDelta = 10; # time (in ms) between frames
    fadeSteps = [ (0.15) (0.17) ]; # in, out
    fadeExclude = [
      "class_g = 'xsecurelock'"
    ];
    # Shadow settings
    shadow = true;
    shadowOpacity = 0.25;
    shadowOffsets = [ (-15) (-15) ]; # X, Y
    shadowExclude = [
      "name = 'cpt_frame_xcb_window'"
      "class_g ?= 'zoom'"
      "class_g = 'dwm'"
    ];
    # General settings
    backend = "glx";
    vSync = true;
    menuOpacity = 0.88; # For reference: dmenu's opacity is 0.8784 percent
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
