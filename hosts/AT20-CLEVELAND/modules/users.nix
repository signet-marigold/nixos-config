{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anhack = {
    isNormalUser = true;
    description = "anhack";
    initialPassword = "hashbrowns";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      discord
      tdesktop
      vscodium
      neovim
      firefox
      kdePackages.kate
      #imv
      mpv
      #zathura
      deluge
    ];
  };

  # Change runtime directory size
  services.logind.extraConfig = "RuntimeDirectorySize=8G";
}
