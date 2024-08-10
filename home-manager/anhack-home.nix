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
    fastfetch
    nnn # terminal file manager
    superfile # more complicated terminal file manager
    tutanota-desktop # mail client
    bitwarden-desktop # password manager
    deluge # torrent
    looking-glass-client # box emulator
    bottles # local software packager

    # archives
    zip
    xz
    unzip
    p7zip
    peazip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for `ls`
    fzf # A command-line fuzzy finder

    qdirstat # visual disk usage
    gparted # visual partition manager
    ksnip # screenshot utility
    xclip # cli clipboard manager
    pqiv # simple image viewer

    # networking tools
    mtr # A network diagnostic tool
    iperf3 # speed test
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # A calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal
    qownnotes # markdown note editor
    nb # markdown note editor
    libreoffice # full office suite
    wordgrinder # cli 'ms word'

    btop # replacement of htop/nmon
    gotop # yet another top
    iotop # io monitoring
    iftop # network monitoring
    nvtopPackages.full # nvidia, amd & intel gpus
    #radeontop # amd gpu utilization


    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # chat
    discord
    hexchat # irc
    pidgin # multi protocol chat
    element-desktop # matrix
    signal-desktop
    telegram-desktop

    # internet browsers
    firefox
    tor-browser # onion firefox

    # code editors
    vscodium
    kdePackages.kate

    # photo editors
    gimp # photoshop style editor
    darktable # lightroom style editor

    # video editors
    kdePackages.kdenlive

    # cad editors
    qcad
    blender

    # audio editors
    ardour
    surge-XT
    muse
    audacity

    # media consumption
    mpv # video player
    tauon # audio player
    shortwave # internet radio
    kdePackages.kasts # podcasts
    calibre # ebook viewer

    # amature radio
    gnuradio # software defined radio server
    gqrx # software defined radio host/server
    tlf # ham radio logging and contest program

    # gaming
    heroic # epic games launcher
    r2modman # mod loader with a wide support of games
    modrinth-app # minecraft launcher with mod support
    lutris # flexible game launcher
    dolphin-emu # gamecube / wii emulator

    # data viewers
    pspp # statistical analysis of sampled data
    gretl # econometric analysis
    sonic-visualiser # waveform analysis
    mandelbulber # make your own fractals
    stellarium # planetarium
  ];

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

  imports = [
    #./modules/firefox.nix
    ./modules/piper-tts
  ];
}
