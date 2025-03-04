{ pkgs, lib, ... }:
{
  security.sudo.enable = true; # sudo should be enabled by default
  security.doas.enable = true; # and doas will escallate if a program requires
  security.doas.extraRules = [{
    users = [ "anhack" ];
    # Optional, retains environment variables while running commands
    # e.g. retains your NIX_PATH when applying your config
    keepEnv = true;
    persist = false;  # Optional, only require password verification a single time
  }];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable Security Services
  users.users.root.hashedPassword = "!";
  security.tpm2 = {
    enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };
  security.apparmor = {
    enable = true;
    packages = with pkgs; [
      apparmor-utils
      apparmor-profiles
    ];
  };
  services.fail2ban.enable = true;
  #security.pam.services.hyprlock = {};
  security.polkit.enable = true;
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  # Add a keyring
  services.gnome.gnome-keyring.enable = true;
  services.passSecretService.enable = true;

  programs.browserpass.enable = true;
  #services.clamav = {
  #  daemon.enable = true;
  #  fangfrisch.enable = true;
  #  fangfrisch.interval = "daily";
  #  updater.enable = true;
  #  updater.interval = "daily"; #man systemd.time
  #  updater.frequency = 12;
  #};
  programs.firejail = {
    enable = true;
    wrappedBinaries = { 
      mpv = {
        executable = "${lib.getBin pkgs.mpv}/bin/mpv";
        profile = "${pkgs.firejail}/etc/firejail/mpv.profile";
      };
      imv = {
        executable = "${lib.getBin pkgs.imv}/bin/imv";
        profile = "${pkgs.firejail}/etc/firejail/imv.profile";
      };
      zathura = {
        executable = "${lib.getBin pkgs.zathura}/bin/zathura";
        profile = "${pkgs.firejail}/etc/firejail/zathura.profile";
      };

      #discord = {
      #  executable = "${lib.getBin pkgs.discord}/bin/discord";
      #  profile = "${pkgs.firejail}/etc/firejail/discord.profile";
      #};
      slack = {
        executable = "${lib.getBin pkgs.slack}/bin/slack";
        profile = "${pkgs.firejail}/etc/firejail/slack.profile";
      };
      telegram-desktop = {
        executable = "${lib.getBin pkgs.telegram-desktop}/bin/telegram-desktop";
        profile = "${pkgs.firejail}/etc/firejail/telegram-desktop.profile";
      };
      #tutanota-desktop = {
      #  executable = "${lib.getBin pkgs.tutanota-desktop}/bin/tutanota-desktop";
      #  profile = "${pkgs.firejail}/etc/firejail/tutanota-desktop.profile";
      #};

      #brave = {
      #  executable = "${lib.getBin pkgs.brave}/bin/brave";
      #  profile = "${pkgs.firejail}/etc/firejail/brave.profile";
      #};
      qutebrowser = {
        executable = "${lib.getBin pkgs.qutebrowser}/bin/qutebrowser";
        profile = "${pkgs.firejail}/etc/firejail/qutebrowser.profile";
      };

      thunar = {
        executable = "${lib.getBin pkgs.xfce.thunar}/bin/thunar";
        profile = "${pkgs.firejail}/etc/firejail/thunar.profile";
      };
      #vscodium = {
      #  executable = "${lib.getBin pkgs.vscodium}/bin/vscodium";
      #  profile = "${pkgs.firejail}/etc/firejail/vscodium.profile";
      #};
    };
  };

  environment.systemPackages = with pkgs; [
    vulnix       #scan command: vulnix --system
    #clamav       #scan command: sudo freshclam; clamscan [options] [file/directory/-]
    chkrootkit   #scan command: sudo chkrootkit

    # passphrase2pgp
    pass-wayland
    pass2csv
    passExtensions.pass-tomb
    passExtensions.pass-update
    passExtensions.pass-otp
    passExtensions.pass-import
    passExtensions.pass-audit
    tomb

    #keepassxc
    authenticator # GUI OTP Authenticator
  ];
}
