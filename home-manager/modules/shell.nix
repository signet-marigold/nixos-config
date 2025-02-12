{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    function fish_greeting
      echo "Welcome to fish the friendly interactive shell"
      echo -n The current time is (set_color yellow; date +%T; set_color normal)
      echo -n on host" "
      echo -s (set_color yellow; echo "$USER"; set_color normal) @ (set_color white; echo "$hostname"; set_color normal)
      echo " "
    end

    if type -q tmux
      if not test -n "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
      end
    end
    '';

    plugins = [
      { name = "done";     src = pkgs.fishPlugins.done.src; }      # Automatically receive notifications when long processes finish
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }  # Augment your fish command line with fzf key bindings
      { name = "forgit";   src = pkgs.fishPlugins.forgit.src; }    # A utility tool powered by fzf for using git interactively
      { name = "hydro";    src = pkgs.fishPlugins.hydro.src; }     # Ultra-pure, lag-free prompt with async Git status
      { name = "grc";      src = pkgs.fishPlugins.grc.src; }       # grc Colourizer for some commands
      { name = "pisces";   src = pkgs.fishPlugins.pisces.src; }    # Auto complete matching pairs
      { name = "puffer";   src = pkgs.fishPlugins.puffer.src; }    # Text Expansions
    ];

    shellAliases = {
      ".."    = "cd ..";
      "..."   = "cd ../..";
      "...."  = "cd ../../../";
      "....." = "cd ../../../../";

      #"dot"   = "cd ~/.dotfiles";
      #"stor"  = "cd /storage/FTP/";

      "cp"    = "cp -v";
      "ddf"   = "df -h";
      "etc"   = "erd -H";
      "mkdir" = "mkdir -p";
      "mv"    = "mv -v";
      "rm"    = "rm -v";
      "rr"    = "rm -rf";

      "ld"    = "eza -ld */ --no-quotes --time-style long-iso";
      "lla"   = "eza -lah --no-quotes --time-style long-iso";
      "ll"    = "eza -lh --no-quotes --time-style long-iso";
      "llr"   = "eza -lhr --no-quotes --time-style long-iso";
      "lls"   = "eza -lh -s size --no-quotes --time-style long-iso";
      "llt"   = "eza -lh -s time --no-quotes --time-style long-iso";
      "lltr"  = "eza -lhr -s time --no-quotes --time-style long-iso";

      "p"     = "feh -Z Pictures/";
      "v"     = "vlc Videos/";
      "avi"   = "vlc *.avi";
      "jpeg"  = "feh -Z *.jpeg";
      "jpg"   = "feh -Z *.jpg";
      "mkv"   = "vlc *.mkv";
      "mov"   = "vlc *.mov";
      "mp3"   = "vlc *.mp3";
      "mp4"   = "vlc *.mp4";
      "png"   = "feh -Z *.png";
      "vvlc"  = "vlc *";
      "webm"  = "vlc *.webm";
    };

    shellAbbrs = {
      # system control shortcuts
      displays = "arandr";
      bluetooth = "blueman-manager";
      sound = "pavucontrol";

      # folder shortcuts
      bg3mods = "conte \"/home/anhack/.steam/steam/steamapps/compatdata/1086940/pfx/drive_c/users/steamuser/AppData/Local/Larian Studios/Baldur's Gate 3/Mods\"";

      # cargo abbreviations
      cb      = "cargo build";
      cc      = "cargo check";
      cdo     = "cargo doc --open";
      cr      = "cargo run";

      # git abbreviations
      gaa     = "git add -A";
      ga      = "git add";
      gbd     = "git branch --delete";
      gb      = "git branch";
      gc      = "git commit";
      gcm     = "git commit -m";
      gcob    = "git checkout -b";
      gco     = "git checkout";
      gd      = "git diff";
      gl      = "git log";
      gp      = "git push";
      gpom    = "git push origin main";
      gs      = "git status";
      gst     = "git stash";
      gstp    = "git stash pop";

      # nix abbreviations
      ncg     = "nix-collect-garbage";

      #nhb     = "home-manager switch --flake .#<DEFAULT>";

      nr20    = "nixos-rebuild --use-remote-sudo switch --upgrade --flake /home/anhack/Repos/nixos-config#AT20-CLEVELAND";
      nr08    = "nixos-rebuild --use-remote-sudo switch --upgrade --flake /home/anhack/Repos/nixos-config#AT08-OBAMA";
    };

    functions = {
      extract = {
        description = "Extract to current directory";
        body = ''
          switch $argv[1]
            case "*.tar.bz2"
              tar xjf $argv[1]
            case "*.tar.gz"
              tar xzf $argv[1]
            case "*.bz2"
              bunzip2 $argv[1]
            case "*.rar"
              unrar e $argv[1]
            case "*.gz"
              gunzip $argv[1]
            case "*.tar"
              tar xf $argv[1]
            case "*.tbz2"
              tar xjf $argv[1]
            case "*.tgz"
              tar xzf $argv[1]
            case "*.zip"
              unzip $argv[1]
            case "*.Z"
              uncompress $argv[1]
            case "*.7z"
              7z x $argv[1]
            case "*"
              echo "unknown extension: $argv[1]"
          end
        '';
      };

      extracttodir = {
        description = "Extract to directory";
        body = ''
          switch $argv[1]
            case "*.tar.bz2"
              tar -xjf $argv[1] -C "$argv[2]"
            case "*.tar.gz"
              tar -xzf $argv[1] -C "$argv[2]"
            case "*.rar"
              unrar x $argv[1] "$argv[2]/"
            case "*.tar"
              tar -xf $argv[1] -C "$argv[2]"
            case "*.tbz2"
              tar -xjf $argv[1] -C "$argv[2]"
            case "*.tgz"
              tar -xzf $argv[1] -C "$argv[2]"
            case "*.zip"
              unzip $argv[1] -d "$argv[2]"
            case "*.7z"
              7za e -y $argv[1] -o"$argv[2]"
            case "*"
              echo "unknown extension: $argv[1]"
          end
        '';
      };

      lsr = {
        description = "List recursively with regex";
        argumentNames = "pattern";
        body = ''
          ls | rg -i $pattern
        '';
      };

      mkcd = {
        description = "Make and change directory";
        argumentNames = "name";
        body = ''
          mkdir -p $name
          cd $name
        '';
      };

      num = {
        description = "Count files in a directory";
        body = ''
          ls -1 $argv | wc -l;
        '';
      };

      wg = {
        description = "wget wrapper";
        body = ''
          set -l num_args (count $argv)

          if test $num_args -eq 1
            wget -c $argv[1]
          else if test $num_args -eq 2
            # arg1 = name, arg2 = url
            wget -c -O $argv[1] $argv[2]
          else
            echo "Incorrect number of arguments"
          end
        '';
      };

      ytarchive = {
        description = "Download youtube video";
        body = ''
          yt-dlp -f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best -o '%(upload_date)s - %(channel)s - %(id)s - %(title)s.%(ext)s' \
            --sponsorblock-mark "all" \
            --geo-bypass \
            --sub-langs 'all' \
            --embed-subs \
            --embed-metadata \
            --convert-subs 'srt' \
            --download-archive $argv[1].txt https://www.youtube.com/$argv[1]/videos;
        '';
      };

      ytarchivevideo = {
        description = "Download video archive";
        body = ''
          yt-dlp -f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best -o '%(upload_date)s - %(channel)s - %(id)s - %(title)s.%(ext)s' \
            --sponsorblock-mark "all" \
            --geo-bypass \
            --sub-langs 'all' \
            --embed-metadata \
            --convert-subs 'srt' \
            --download-archive $argv[1] $argv[2];
        '';
      };

      ytd = {
        description = "Download video";
        body = ''
          yt-dlp -f bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best -o '%(upload_date)s - %(channel)s - %(id)s - %(title)s.%(ext)s' \
            --sponsorblock-mark "all" \
            --geo-bypass \
            --sub-langs 'all' \
            --embed-subs \
            --embed-metadata \
            --convert-subs 'srt' \
            $argv
        '';
      };

      eat = {
        description = "Swallow parent terminal emulator on open";
        body = ''
          $argv &
          disown
          exit
        '';
      };

      # (o)pen (f)ile manager {of}-> only fans (which started out as a competetor to) -> patreon (which was co-founded by youtuber and artist) -> jack conte
      conte = {
        description = "Open file manager";
        argumentNames = "directory";
        body = ''
          if not test -n "$directory"
            set directory "."
          end
          thunar $directory &
          disown
          exit
        '';
      };

      termcolortext = {
        description = "Print all terminal colors";
        body = ''
          echo (set_color black;echo black;set_color blue;echo blue;set_color cyan;echo cyan;set_color green;echo green;set_color magenta;echo magenta;set_color red;echo red;set_color white;echo white;set_color yellow;echo yellow;set_color normal;echo normal) && echo (set_color black;echo █████;set_color blue;echo ████;set_color cyan;echo ████;set_color green;echo █████;set_color magenta;echo ███████;set_color red;echo ███;set_color white;echo █████;set_color yellow;echo ██████;set_color normal;echo ██████) && echo (set_color brblack;echo brblack;set_color brblue;echo brblue;set_color brcyan;echo brcyan;set_color brgreen;echo brgreen;set_color brmagenta;echo brmagenta;set_color brred;echo brred;set_color brwhite;echo brwhite;set_color bryellow;echo bryellow) && echo (set_color brblack;echo ███████;set_color brblue;echo ██████;set_color brcyan;echo ██████;set_color brgreen;echo ███████;set_color brmagenta;echo █████████;set_color brred;echo █████;set_color brwhite;echo ███████;set_color bryellow;echo ████████)
        '';
      };
    };
  };
}
