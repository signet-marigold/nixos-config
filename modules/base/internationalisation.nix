{ pkgs, ... }:
{
  # Select internationalisation properties.
  services.xserver = {
    xkb.layout = "us";
  };

  console.useXkbConfig = true; # Extend X keyboard keymap to console, which affects virtual consoles such as `tty`

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [ libpinyin m17n ];
  };

  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "es_US.UTF-8/UTF-8"
    "zh_CN.UTF-8/UTF-8"
    "zh_TW.UTF-8/UTF-8"
  ];
  
  i18n.defaultLocale  = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT    = "en_US.UTF-8";
    LC_MONETARY       = "en_US.UTF-8";
    LC_NAME           = "en_US.UTF-8";
    LC_NUMERIC        = "en_US.UTF-8";
    LC_PAPER          = "en_US.UTF-8";
    LC_TELEPHONE      = "en_US.UTF-8";
    LC_TIME           = "en_US.UTF-8";
  };

  environment.systemPackages = with pkgs; [
    nuspell
    hyphen
    hunspell
    hunspellDicts.en_US
    hunspellDicts.es_ES
    pinyin-tool
    libpinyin
  ];
}
