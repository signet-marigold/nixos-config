{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anhack = {
    isNormalUser = true;
    description = "anhack";
    shell = pkgs.fish;
    initialPassword = "hashbrownzebrastripes";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" "render" "libvirtd" ];
    #packages = with pkgs; [ ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";

  imports = [
    #./sops.nix <- sops at the user level is disabled in favor of authenticating at the system level
    ./spring-cleaning.nix
  ];
}
