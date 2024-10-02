{
  services.picom.enable = true; # A compositor for transparency and other effects

  imports = [
    ../../dwm
    ../../dmenu
    ../../st
    ../../login/lightgreet.nix
    ../../slock.nix
    ../../conky.nix
    ../../auto-cpufreq.nix
    ./packages/dhst
    ./packages/hhst
  ];
}
