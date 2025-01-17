{ pkgs, ... }:
{
  imports = [
    # User general config
    ../../users/anhack
    # Host specific modules
    ./modules/conky
  ];

  home.packages = with pkgs; [
    # ---AI
    ollama-cuda         # Model loader, originally designed as an open-source runner for llama
    kdePackages.alpaka  # Front end GUI for ollama
  ];
}
