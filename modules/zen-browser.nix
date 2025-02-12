{ inputs, ... }:
{
  environment.systemPackages = [
    inputs.zen-browser.packages."x86_64-linux".default # <- this will be here until zen is added to the nix store
  ];
}
