{ pkgs, ... }:
{
  # ---AI
  services.ollama = { # Model loader, originally designed as an open-source runner for llama2
    enable = true;
    acceleration = "cuda";
  };

  environment.systemPackages = with pkgs; [
    #open-webui
    oterm
    lmstudio
  ];
}
