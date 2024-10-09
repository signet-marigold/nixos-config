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
    # chat
    discord
    hexchat # irc
    pidgin # multi protocol chat
    element-desktop # matrix
    signal-desktop
    telegram-desktop
    slack

    # internet browsers
    # >in imports below

    # code editors
    vscodium
    #kdePackages.kate

    # photo editors
    gimp # photoshop style editor
    inkscape # vector graphics
    darktable # lightroom style editor

    # video editors
    kdePackages.kdenlive
    # video record
    obs-studio

    # cad editors
    qcad
    blender

    # audio editors
    ardour
    surge-XT
    muse
    audacity

    # media consumption
    mpv # media player
    vlc # media player
    tauon # audio player
    picard # music tag editor
    shortwave # internet radio
    kdePackages.kasts # podcasts
    calibre # ebook viewer
    freetube # free youtube frontend client

    # amature radio
    gnuradio # software defined radio server
    gqrx # software defined radio host/server
    tlf # ham radio logging and contest program

    # gaming
    heroic # epic games launcher
    r2modman # mod loader with a wide support of games
    #modrinth-app # minecraft launcher with mod support
    prismlauncher # open source minecraft launcher with mod support
    lutris # flexible game launcher
    dolphin-emu # gamecube / wii emulator

    # data viewers
    pspp # statistical analysis of sampled data
    gretl # econometric analysis
    sonic-visualiser # waveform analysis
    mandelbulber # make your own fractals
    stellarium # planetarium

    # misc
    nnn # terminal file manager
    superfile # more complicated terminal file manager
    tutanota-desktop # mail client
    bitwarden-desktop # password manager
    deluge # torrent
    looking-glass-client # box emulator
    bottles # local software packager
    qalculate-gtk # simple desktop calculator
    scanmem # live system memory editor
    jdk # java
    solaar # logitech unifying driver and management

    # productivity
    hugo # static website generator
    glow # markdown previewer in terminal
    qownnotes # markdown note editor
    nb # markdown note editor
    libreoffice # full office suite
    wordgrinder # cli 'ms word'
  ];

  programs.home-manager.enable = true;



  imports = [
    ../../modules/base.nix
    ../../modules/browsers
    ../../modules/piper-tts
    ../../modules/shell.nix
    ../../modules/theme.nix
    ../../modules/git.nix
    ../../modules/dunst.nix
    ./default-applications.nix
  ];
}
