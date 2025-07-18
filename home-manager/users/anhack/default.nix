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
    discord #>swapped for webcord
    #webcord
    webcord-vencord
    hexchat            # IRC
    pidgin             # Multi protocol chat
    element-desktop    # Matrix
    signal-desktop
    telegram-desktop
    slack
    #unstable.teamspeak6-client
    teamspeak3

    # ---Internet browsers
    # >in imports below

    # ---Code editors
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
    #modrinth-app        # Minecraft launcher with mod support
    prismlauncher       # Open source minecraft launcher with mod support
    lutris              # Flexible game launcher
    dolphin-emu         # Gamecube / Wii emulator
    wargus              # Warcraft 2 mod
    retroarch           # Retro game hardware emulator suite

    # ---Data viewers
    pspp                # Statistical analysis of sampled data
    gretl               # Econometric analysis
    sonic-visualiser    # Waveform analysis
    mandelbulber        # Make your own fractals
    stellarium          # Planetarium
    mousam              # Weather
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
    solaar              # Logitech unifying reciever management

    # ---Productivity
    hugo                # Static website generator
    glow                # Markdown previewer in terminal
    qownnotes           # Markdown note editor
    nb                  # Markdown note editor
    cherrytree          # A hierarchical note taking app
    libreoffice         # Full office suite
    dia                 # Gnome diagram drawing
    wordgrinder         # CLI 'ms word'
    anki-bin            # Desktop flashcards
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
    ../../modules/virtualisation.nix
    ../../modules/pluvio.nix
    ./default-applications.nix
  ];
}
