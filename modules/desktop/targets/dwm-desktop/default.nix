{
  services.picom.enable = true; # A compositor for transparency and other effects

  imports = [
    ../../dwm
    ../../dmenu
    ../../st
    ../../login/lightgreet.nix
    ../../lock/lightlocker.nix
    ../../conky.nix
    ../../auto-cpufreq.nix
    ./packages/dhst
    ./packages/hhst
  ];
}
