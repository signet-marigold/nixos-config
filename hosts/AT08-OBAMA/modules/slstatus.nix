{ pkgs, ... }:

{
  # Install suckless status bar
  nixpkgs.overlays = [
    (self: super: {
      slstatus = super.slstatus.overrideAttrs (oldAttrs: rec {
        # Override header file in build
        configFile = super.writeText "config.h" (builtins.readFile ../sl-headers/slstatus-config.h);
        postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
      });
    })
  ];

  # Require package
  environment.systemPackages = with pkgs; [
    slstatus
  ];

  # Set service to start slstatus on x init
  systemd.user.services.slstatus = {
    description = "Suckless Status";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.slstatus}/bin/slstatus";
      RestartSec = 3;
      Restart = "always";
    };
  };
}
