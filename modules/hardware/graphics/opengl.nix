{ pkgs, ... }:

{
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    #enable32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      mesa
      nv-codec-headers-12
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      vaapiVdpau
      libvdpau-va-gl
      mesa
    ];
  };
}
