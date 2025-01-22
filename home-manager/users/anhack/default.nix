{ pkgs, ... }:
{
  home.username = "anhack";
  home.homeDirectory = "/home/anhack";
  home.stateVersion = "24.11";

  #xresources.properties = {
  #  "Xcursor.size" = 24;
  #  "Xft.dpi" = 92;
  #};

  home.packages = with pkgs; [
    # ---Chat
    #discord >swapped for webcord
    webcord
    #webcord-vencord
    hexchat            # IRC
    pidgin             # Multi protocol chat
    element-desktop    # Matrix
    signal-desktop
    telegram-desktop
    slack

    # ---Internet browsers
    # >in imports below

    # ---Code editors
    vscodium
    #kdePackages.kate
    # >moved to root:modules/editors

    # ---Photo editors
    gimp                # Photoshop style editor
    inkscape            # Vector graphics
    darktable           # Lightroom style editor

    # ---Video editors
    kdePackages.kdenlive
    # ---Video record
    obs-studio

    # ---Cad editors
    qcad
    blender

    # ---Audio editors
    ardour
    surge-XT
    muse
    audacity

    # ---Media consumption
    mpv                 # Media player
    vlc                 # Media player
    tauon               # Music player
    picard              # Music tag editor
    shortwave           # Internet radio
    kdePackages.kasts   # Podcasts
    calibre             # Ebook viewer
    freetube            # Free youtube frontend client

    # ---Amature radio
    gnuradio            # Software defined radio server
    gqrx                # Software defined radio host/server
    tlf                 # Ham radio logging and contest program

    # ---Gaming
    heroic              # Epic games launcher
    r2modman            # Mod loader with a wide support of games
    # modrinth-app        # Minecraft launcher with mod support
    prismlauncher       # Open source minecraft launcher with mod support
    lutris              # Flexible game launcher
    dolphin-emu         # Gamecube / Wii emulator

    # ---Data viewers
    pspp                # Statistical analysis of sampled data
    gretl               # Econometric analysis
    sonic-visualiser    # Waveform analysis
    mandelbulber        # Make your own fractals
    stellarium          # Planetarium
    gnome-weather       # Weather
    ghex                # Hex editor

    # ---Misc.
    #nnn                 # Terminal file manager
    #superfile           # More complicated terminal file manager
    broot               # Advanced terminal file manager
    tutanota-desktop    # Mail client
    bitwarden-desktop   # Password manager
    deluge              # Torrent manager
    bottles             # Local software packager
    qalculate-gtk       # Simple GUI calculator app
    scanmem             # Live system memory editor
    jdk                 # Java
    solaar              # Logitech unifying driver and management

    # ---Productivity
    hugo                # Static website generator
    glow                # Markdown previewer in terminal
    qownnotes           # Markdown note editor
    nb                  # Markdown note editor
    cherrytree          # A hierarchical note taking app
    libreoffice         # Full office suite
    wordgrinder         # CLI 'ms word'
  ];

  programs.home-manager.enable = true;

  imports = [
    ../../modules/base.nix
    ../../modules/browsers
    ../../modules/piper-tts
    ../../modules/shell.nix
    ../../modules/theme.nix
    ../../modules/git.nix
    #../../modules/dunst.nix
    ./default-applications.nix
  ];
}
