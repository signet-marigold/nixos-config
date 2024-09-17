{ pkgs, ... }:

{
  xdg = {
    desktopEntries = {
      qutebrowser = {
        name = "Qute Browser";
        exec = "${pkgs.qutebrowser}/bin/qutebrowser";
      };
      firefox = {
        name = "Firefox";
        exec = "${pkgs.firefox}/bin/firefox";
      };
      mullvad-browser = {
        name = "Mullvad Browser";
        exec = "${pkgs.mullvad-browser}/bin/mullvad-browser";
      };
      tor-browser = {
        name = "Tor Browser";
        exec = "${pkgs.tor-browser}/bin/tor-browser";
      };
      librewolf = {
        name = "LibreWolf";
        exec = "${pkgs.librewolf}/bin/librewolf";
      };
      zathura = {
        name = "Zathura";
        exec = "${pkgs.zathura}/bin/zathura";
      };
      pqiv = {
        name = "pqiv";
        exec = "${pkgs.pqiv}/bin/pqiv";
      };
      mpv = {
        name = "mpv";
        exec = "${pkgs.mpv}/bin/mpv";
      };
      kate = {
        name = "Kate";
        exec = "${pkgs.kdePackages.kate}/bin/kate";
      };
      #neovim = {
      #  name = "Neovim";
      #  exec = "${pkgs.st}/bin/st ${nvim}.defaultPackage.${pkgs.system}/bin/nvim";
      #};
      tutanota = {
        name = "TutaNota Mail";
        exec = "${pkgs.tutanota-desktop}/bin/tutanota-desktop";
      };
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";

        "x-scheme-handler/email" = "tutanota.desktop";

        "application/pdf" = "zathura.desktop";

        "text/plain" = "kate.desktop";

        "image/bmp" = "pqiv.desktop";
        "image/fif" = "pqiv.desktop";
        "image/gif" = "pqiv.desktop";
        "image/ief" = "pqiv.desktop";
        "image/jpeg" = "pqiv.desktop";
        "image/vasa" = "pqiv.desktop";
        "image/naplps" = "pqiv.desktop";
        "image/pict" = "pqiv.desktop";
        "image/png" = "pqiv.desktop";
        "image/cmu-raster" = "pqiv.desktop";
        "image/svg+xml" = "pqiv.desktop";
        "image/tiff" = "pqiv.desktop";
        "image/florian" = "pqiv.desktop";
        "image/vnd.wap.wbmp" = "pqiv.desktop";
        "image/webp" = "pqiv.desktop";
        "image/xbm" = "pqiv.desktop";
        "image/vnd.xiff" = "pqiv.desktop";
        "image/x-dwg" = "pqiv.desktop";
        "image/x-icon" = "pqiv.desktop";
        "image/x-jps" = "pqiv.desktop";
        "image/x-niff" = "pqiv.desktop";
        "image/x-portable-bitmap" = "pqiv.desktop";
        "image/x-pict" = "pqiv.desktop";
        "image/x-pcx" = "pqiv.desktop";
        "image/x-portable-graymap" = "pqiv.desktop";
        "image/x-xpixmap" = "pqiv.desktop";
        "image/x-portable-anymap" = "pqiv.desktop";
        "image/x-portable-pixmap" = "pqiv.desktop";
        "image/x-quicktime" = "pqiv.desktop";
        "image/x-rgb" = "pqiv.desktop";

        "video/msvideo" = "mpv.desktop";
        "video/avi" = "mpv.desktop";
        "video/mpeg" = "mpv.desktop";
        "video/x-motion-jpeg" = "mpv.desktop";
        "video/x-matroska" = "mpv.desktop";
        "video/quicktime" = "mpv.desktop";
        "video/x-qtc" = "mpv.desktop";
        "video/x-sgi-movie" = "mpv.desktop";
        "video/mp4" = "mpv.desktop";
        "video/vnd.rn-realvideo" = "mpv.desktop";
        "video/x-scm" = "mpv.desktop";
        "video/mp2t" = "mpv.desktop";
        "video/vdo" = "mpv.desktop";
        "video/vivo" = "mpv.desktop";
        "video/vosaic" = "mpv.desktop";
        "video/webm" = "mpv.desktop";

        #"application/book" = ;
      };
    };
  };
}
