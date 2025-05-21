{ pkgs, ... }:
{
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplip ];
  };
  # services.avahi = {
  #   enable = true;
  #   nssmdns = true;
  # };
}
