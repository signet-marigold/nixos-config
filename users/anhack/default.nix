{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anhack = {
    isNormalUser = true;
    description = "anhack";
    shell = pkgs.fish;
    initialPassword = "hashbrownzebrastripes";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" "render" "libvirtd" ]; # "vboxusers" ];
    packages = with pkgs; [];
  };

  # Add user to vboxusers
  #users.extraGroups.vboxusers.members = [ "anhack" ];

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";

  imports = [
    ./spring-cleaning.nix
  ];
}
