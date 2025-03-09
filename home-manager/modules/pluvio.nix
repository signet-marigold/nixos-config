{ inputs, ... }:
{
  home.packages = [
    inputs.pluvio.packages."x86_64-linux".default
  ];
}
