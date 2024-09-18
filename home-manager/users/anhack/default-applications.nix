{ pkgs, ... }:

{
  xdg = {
    desktopEntries = {
      qutebrowser = {
        name = "qutebrowser";
        exec = "${pkgs.qutebrowser}/bin/qutebrowser";
      };
      firefox = {
        name = "Firefox";
        exec = "${pkgs.firefox}/bin/firefox";
      };
      mullvad-browser = {
        name = "Mullvad browser";
        exec = "${pkgs.mullvad-browser}/bin/mullvad-browser";
      };
      tor-browser = {
        name = "Tor browser";
        exec = "${pkgs.tor-browser}/bin/tor-browser";
      };
      librewolf = {
        name = "LibreWolf";
        exec = "${pkgs.librewolf}/bin/librewolf";
      };
      zathura = {
        name = "Zathura";
        exec = "${pkgs.zathura}/bin/zathura";
      }; # pdf viewer
      pqiv = {
        name = "PQIV";
        exec = "${pkgs.pqiv}/bin/pqiv";
      }; # image viewer
      peazip = {
        name = "Peazip";
        exec = "${pkgs.peazip}/bin/peazip";
      }; # archive manager
      ksnip = {
        name = "Ksnip";
        exec = "${pkgs.ksnip}/bin/ksnip";
      }; # Screenshot utility
      kate = {
        name = "Kate";
        exec = "${pkgs.kdePackages.kate}/bin/kate";
      };
      #neovim = {
      #  name = "Neovim";
      #  exec = "${pkgs.st}/bin/st ${nvim}.defaultPackage.${pkgs.system}/bin/nvim";
      #};
      vscodium = {
        name = "VSCodium";
        exec = "${pkgs.vscodium}/bin/vscodium";
      };
      tutanota = {
        name = "TutaNota Mail";
        exec = "${pkgs.tutanota-desktop}/bin/tutanota-desktop";
      };
      java = {
        name = "Java";
        exec = "${pkgs.jdk}/bin/java -jar";
      };
      libreoffice-writer = {
        name = "LibreOffice Writer";
        exec = "${pkgs.libreoffice}/bin/swriter";
      };
      libreoffice-calc = {
        name = "LibreOffice Calc";
        exec = "${pkgs.libreoffice}/bin/scalc";
      };
      libreoffice-impress = {
        name = "LibreOffice Impress";
        exec = "${pkgs.libreoffice}/bin/simpress";
      };
      libreoffice-draw = {
        name = "LibreOffice Draw";
        exec = "${pkgs.libreoffice}/bin/sdraw";
      };
      libreoffice-math = {
        name = "LibreOffice Math";
        exec = "${pkgs.libreoffice}/bin/smath";
      };
      libreoffice-base = {
        name = "LibreOffice Base";
        exec = "${pkgs.libreoffice}/bin/sbase";
      };
      hexchat = {
        name = "HexChat";
        exec = "${pkgs.hexchat}/bin/hexchat";
      }; # irc
      pidgin = {
        name = "Pidgin";
        exec = "${pkgs.pidgin}/bin/pidgin";
      }; # multi protocol chat
      gimp = {
        name = "GIMP";
        exec = "${pkgs.gimp}/bin/gimp";
      }; # photoshop style editor
      inkscape = {
        name = "Inkscape";
        exec = "${pkgs.inkscape}/bin/inkscape";
      }; # vector graphics
      darktable = {
        name = "Darktable";
        exec = "${pkgs.darktable}/bin/darktable";
      }; # lightroom style editor
      kdenlive = {
        name = "Kdenlive";
        exec = "${pkgs.kdePackages.kdenlive}/bin/kdenlive";
      };
      obs-studio = {
        name = "OBS Studio";
        exec = "${pkgs.obs-studio}/bin/obs-studio";
      };
      qcad = {
        name = "QCad";
        exec = "${pkgs.qcad}/bin/qcad";
      };
      blender = {
        name = "Blender";
        exec = "${pkgs.blender}/bin/blender";
      };
      ardour = {
        name = "Ardour";
        exec = "${pkgs.ardour}/bin/ardour";
      };
      surge-XT = {
        name = "Surge XT";
        exec = "${pkgs.surge-XT}/bin/surge-XT";
      };
      muse = {
        name = "Muse";
        exec = "${pkgs.muse}/bin/muse";
      };
      audacity = {
        name = "Audacity";
        exec = "${pkgs.audacity}/bin/audacity";
      };
      mpv = {
        name = "MPV Media Player";
        exec = "${pkgs.mpv}/bin/mpv";
      }; # general media player
      vlc = {
        name = "VLC Media Player";
        exec = "${pkgs.vlc}/bin/vlc";
      }; # general media player
      tauon = {
        name = "Tauon Music Player";
        exec = "${pkgs.tauon}/bin/tauon";
      }; # audio player
      calibre = {
        name = "Calibre";
        exec = "${pkgs.calibre}/bin/calibre";
      }; # ebook viewer
      gqrx = {
        name = "GQRX radio";
        exec = "${pkgs.gqrx}/bin/gqrx";
      };
      pspp = {
        name = "PSPP analyzer";
        exec = "${pkgs.pspp}/bin/pspp";
      }; # statistical analysis of sampled data
      gretl = {
        name = "Gretl analyzer";
        exec = "${pkgs.gretl}/bin/gretl";
      }; # econometric analysis
      sonic-visualiser = {
        name = "Sonic Visualiser";
        exec = "${pkgs.sonic-visualiser}/bin/sonic-visualiser";
      }; # waveform analysis
      deluge = {
        name = "Deluge torrent";
        exec = "${pkgs.deluge}/bin/deluge";
      }; # torrent
      glow = {
        name = "Glow markdown";
        exec = "${pkgs.glow}/bin/glow";
      }; # markdown previewer in terminal
      qownnotes = {
        name = "QOwnNotes";
        exec = "${pkgs.qownnotes}/bin/qownnotes";
      }; # markdown note editor
      nb = {
        name = "NB markdown";
        exec = "${pkgs.nb}/bin/nb";
      }; # markdown note editor
      wordgrinder = {
        name = "WordGrinder";
        exec = "${pkgs.wordgrinder}/bin/wordgrinder";
      }; # cli word
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        # HTML, Browser
        "text/html"                = "librewolf.desktop"; # .html .htm (HyperText Markup Language)
        "application/xhtml+xml"    = "librewolf.desktop"; # .xhtml
        "x-scheme-handler/http"    = "librewolf.desktop"; # http://
        "x-scheme-handler/https"   = "librewolf.desktop"; # https://
        "x-scheme-handler/about"   = "librewolf.desktop"; # about://
        "x-scheme-handler/unknown" = "librewolf.desktop"; # unknown://

        # Book, Document
        "application/vnd.amazon.ebook" = "calibre.desktop"; # .azw (Amazon Kindle)
        "application/epub+zip"     = "calibre.desktop"; # .epub (Electronic publication)
        "application/book"         = "calibre.desktop"; # .book .boo
        "application/pdf"          = ["zathura.desktop" "librewolf.desktop"]; # .pdf (Adobe Portable Document Format)

        # Office
        "application/vnd.oasis.opendocument.spreadsheet"                            = "libreoffice-calc.desktop";    # .ods  (OpenDocument spreadsheet document)
        "text/csv"                                                                  = "libreoffice-calc.desktop";    # .csv  (Comma-separated values)
        "application/vnd.ms-excel"                                                  = "libreoffice-calc.desktop";    # .xls  (Microsoft Excel)
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"         = "libreoffice-calc.desktop";    # .xlsx (Microsoft Excel (OpenXML))
        "application/vnd.oasis.opendocument.presentation"                           = "libreoffice-impress.desktop"; # .odp  (OpenDocument presentation document)
        "application/vnd.ms-powerpoint"                                             = "libreoffice-impress.desktop"; # .ppt  (Microsoft PowerPoint)
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "libreoffice-impress.desktop"; # .pptx (Microsoft PowerPoint (OpenXML))
        "application/vnd.oasis.opendocument.text"                                   = "libreoffice-writer.desktop";  # .odt  (OpenDocument text document)
        "application/x-abiword"                                                     = "libreoffice-writer.desktop";  # .abw  (AbiWord document)
        "application/msword"                                                        = "libreoffice-writer.desktop";  # .doc  (Microsoft Word)
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document"   = "libreoffice-writer.desktop";  # .docx (Microsoft Word (OpenXML))

        # Application specific
        "application/ogg"          = ["mpv.desktop" "vlc.desktop"]; # .ogx (Ogg)
        "application/vnd.visio"    = "inkscape.desktop"; # .vsd (Microsoft Visio)
        "text/calendar"            = "kate.desktop"; # .ics (iCalendar format)
        "application/java-archive" = "java.desktop"; # .jar (Java Archive)
        "font/otf"                 = ""; # .otf
        "font/ttf"                 = ""; # .ttf (TrueType Font)
        "font/woff"                = ""; # .woff (Web Open Font Format)
        "font/woff2"               = ""; # .woff2 (Web Open Font Format)
        "application/vnd.ms-fontobject" = ""; # .eot (Microsoft Embedded OpenType fonts)
        "application/x-shockwave-flash" = ""; # .swf (Adobe Flash)
        "application/vnd.apple.installer+xml" = ""; # .mpkg (Apple Installer Package)

        # Editable text format
        "text/plain"               = "kate.desktop"; # .txt Text
        "application/rtf"          = "kate.desktop"; # .rtf (Rich Text Format)
        "application/x-sh"         = "kate.desktop"; # .sh (bourne SHell script)
        "application/x-csh"        = "kate.desktop"; # .csh (C-Shell script)
        "text/css"                 = "kate.desktop"; # .css (Cascading Style Sheets)
        "application/x-httpd-php"  = "kate.desktop"; # .php (Hypertext Preprocessor (Personal Home Page))
        "application/xml"          = "kate.desktop"; # .xml
        "text/xml"                 = "kate.desktop"; # .xml
        "application/vnd.mozilla.xul+xml" = "kate.desktop"; # .xul
        "application/javascript"   = "kate.desktop"; # .js .mjs (ECMAScript/JavaScript)
        "application/json"         = "kate.desktop"; # .json (JavaScript Object Notation Format)
        "application/ld+json"      = "kate.desktop"; # .jsonld (JavaScript Object Notation Linked Data)
        "text/markdown"            = "nb.desktop"; # .md (Markdown)

        # Generic
        "application/octet-stream" = ""; # Any kind of binary data

        # Image
        "image/gif"                = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .gif
        "image/x-icon"             = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .ico
        "image/jpeg"               = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .jpeg .jpg
        "image/png"                = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .png
        "image/apng"               = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .apng
        "image/svg+xml"            = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .svg
        "image/tiff"               = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .tiff .tif
        "image/webp"               = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .webp (WEBP image)
        "image/avif"               = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .avif
        "image/bmp"                = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .bmp .bm
        "image/fif"                = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .fif
        "image/ief"                = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .ief iefs
        "image/vasa"               = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .mcf
        "image/naplps"             = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .naplps .nap
        "image/pict"               = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .pict .pic
        "image/cmu-raster"         = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .rast .ras
        "image/florian"            = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .turbot
        "image/vnd.wap.wbmp"       = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .wbmp
        "image/xbm"                = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .xbm
        "image/vnd.xiff"           = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .xif
        "image/x-dwg"              = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .dwg
        "image/x-jps"              = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .jps
        "image/x-niff"             = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .niff .nif
        "image/x-portable-bitmap"  = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .pbm
        "image/x-pict"             = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .pct
        "image/x-pcx"              = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .pct .pcx
        "image/x-portable-graymap" = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .pgm
        "image/x-xpixmap"          = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .pm
        "image/x-portable-anymap"  = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .pnm
        "image/x-portable-pixmap"  = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .ppm
        "image/x-quicktime"        = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .qif .qti .qtif
        "image/x-rgb"              = ["pqiv.desktop" "ksnip.desktop" "gimp.desktop"]; # .rgb

        # Video
        "video/msvideo"            = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .avi
        "video/x-msvideo"          = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .avi
        "video/avi"                = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .avi
        "video/mpeg"               = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .m1v .m2v .mp2 .mp3 .mpa .mpeg .mpg
        "video/x-motion-jpeg"      = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .mjpg
        "video/x-matroska"         = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .mkv (Matroska video)
        "video/quicktime"          = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .mov .moov (Quicktime)
        "video/x-qtc"              = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .qtc
        "video/x-sgi-movie"        = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .movie .mv
        "video/mp4"                = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .mp4
        "video/vnd.rn-realvideo"   = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .rv
        "video/x-scm"              = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .scm
        "video/mp2t"               = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .ts (MPEG transport stream)
        "video/vdo"                = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .vdo
        "video/vivo"               = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .vivo .viv
        "video/vosaic"             = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .vos
        "video/webm"               = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .webm (WEBM video)
        "video/ogg"                = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .ogv (Ogg video)
        "video/vnd.dlna.mpeg-tts"  = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .ts?
        "video/3gpp"               = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .3gpp .3gp (Third Generation Partnership Project)
        "video/3gpp2"              = ["mpv.desktop" "vlc.desktop" "kdenlive.desktop"]; # .3gpp2 .3gp2 .3g2 (Third Generation Partnership Project)

        # Audio
        "audio/aac"                = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .aac (AAC audio)
        "audio/mpeg"               = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .mp3 (MP3 audio)
        "audio/midi"               = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .midi .mid (Musical Instrument Digital Interface)
        "audio/x-matroska"         = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .mka (Matroska audio)
        "audio/ogg"                = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .oga .opus (Ogg audio)
        "audio/wav"                = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .wav (Waveform Audio Format)
        "audio/x-wav"              = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .wav (Waveform Audio Format)
        "audio/webm"               = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .weba (WEBM audio)
        "application/x-cdf"        = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .cda (CD audio)
        "audio/3gpp"               = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .3gpp .3gp (Third Generation Partnership Project)
        "audio/3gpp2"              = ["mpv.desktop" "vlc.desktop" "tauon.desktop" "audacity.desktop" "sonic-visualiser.desktop"]; # .3gpp2 .3gp2 .3g2 (Third Generation Partnership Project)

        # Archive
        "application/x-bzip"       = "peazip.desktop"; # .bz (BZip archive)
        "application/x-bzip2"      = "peazip.desktop"; # .bz2 (BZip2 archive)
        "application/zip"          = "peazip.desktop"; # .zip (Archive)
        "application/x-tar"        = "peazip.desktop"; # .tar (Tape archive)
        "application/vnd.rar"      = "peazip.desktop"; # .rar (Roshal archive)
        "application/x-7z-compressed" = "peazip.desktop"; # .7z (7-zip archive)
        "application/gzip"         = "peazip.desktop"; # .gz (GZip compressed archive)
        "application/x-gzip"       = "peazip.desktop"; # .gz (GZip compressed archive)
        "application/x-freearc"    = "peazip.desktop"; # .arc (Archive document)
      };
    };
  };
}
