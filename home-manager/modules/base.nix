{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # utils
    ripgrep # recursively searches directories for a regex pattern
    fzf # A command-line fuzzy finder
    grc # generic colouriser for the command line
    eza # A modern replacement for `ls`

    file
    which
    gnused
    gawk
    gnupg
    #tree
    erdtree # file-tree visualizer and disk usage analyzer

    qdirstat # visual disk usage analyzer
    gparted # visual disk partition manager

    ksnip # screenshot utility
    xclip # cli clipboard manager

    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq

    zathura # simple pdf viewer
    pqiv # simple image viewer
    feh # simple image viewer

    # archives
    zip
    xz
    unzip
    gzip
    p7zip
    peazip
    gnutar
    zstd

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
    yt-dlp # command-line audio/video downloader
    wget # network downloader

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    btop # replacement of htop/nmon
    gotop # yet another top
    iotop # io monitoring
    iftop # network monitoring
    nvtopPackages.full # top for nvidia, amd & intel gpus
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
  ];
}
