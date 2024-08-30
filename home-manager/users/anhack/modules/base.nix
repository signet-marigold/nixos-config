{ pkgs, ... }:

{
  home.packages = with pkgs; [
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

    # archives
    zip
    xz
    unzip
    p7zip
    peazip

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
  ];
}
