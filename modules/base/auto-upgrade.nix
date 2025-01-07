{ inputs, ... }:
{
  # Scheduled auto upgrade system (this is only for system upgrades, 
  # if you want to upgrade cargo\npm\pip global packages, docker containers or different part of the system 
  # or get really full system upgrade, use `topgrade` CLI utility manually instead.
  # I recommend running `topgrade` once a week or at least once a month)
  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    persistent = false;
    #channel = "https://nixos.org/channels/nixos-24.11";
    operation = "switch"; # If you don't want to apply updates immediately, only after rebooting, use `boot` option in this case
    flake = inputs.self.outPath;
    flags = [
      "--update-input" "nixpkgs"
      "--update-input" "rust-overlay"
      "--commit-lock-file"
      "-L" # print build logs
    ];
    dates = "weekly";
    randomizedDelaySec = "45min";
  };
}
