{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wasmedge
    wasmer
    #lunatic <- error building 0.13.2 on nixos 24.11
    wasmi
    # wasm3
  ];
}
