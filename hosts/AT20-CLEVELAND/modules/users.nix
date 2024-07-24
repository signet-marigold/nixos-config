{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anhack = {
    isNormalUser = true;
    description = "anhack";
    initialPassword = "hashbrowns";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      discord
      tdesktop
      vscodium
      neovim
      firefox
      kdePackages.kate
      kdePackages.kdenlive
      #imv
      mpv
      #zathura
      deluge
      tutanota-desktop
      heroic
      qownnotes
      r2modman
      modrinth-app
      bitwarden-desktop
      bottles
      tor-browser
      gnuradio
      gqrx
      tlf
      libreoffice
      stellarium
      looking-glass-client
      hexchat
      darktable
      calibre
      gparted
      element-desktop
      qdirstat
      qcad
      pspp
      gretl
      kdePackages.kasts
      vscodium
      peazip
      sonic-visualiser
      tauon
      shortwave
      ardour
      surge-XT
      muse
      mandelbulber
      lutris
      dolphin-emu
      audacity
    ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
