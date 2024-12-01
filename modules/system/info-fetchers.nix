{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ##neofetch # Replaced by fastfetch
    fastfetch
    onefetch
    ipfetch
    cpufetch
    ramfetch
    starfetch
    octofetch
    htop
    bottom
    zfxtop
    kmon

    # vulkan-tools
    # opencl-info
    # clinfo
    # vdpauinfo
    # libva-utils
    # nvtop
    gpu-viewer
    dig
    speedtest-rs
  ];
}
