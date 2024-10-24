{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anhack = {
    isNormalUser = true;
    description = "anhack";
    shell = pkgs.fish;
    initialPassword = "hashbrownzebrastripes";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" "render" "libvirtd" ];
    packages = with pkgs; [
      bitwarden-desktop
    ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";

  imports = [
    #./sops.nix
    ./spring-cleaning.nix
  ];
}
