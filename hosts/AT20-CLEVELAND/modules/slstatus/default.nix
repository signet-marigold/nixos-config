{ pkgs, ... }:

{
  # Mod slstatus package
  nixpkgs.overlays = [
    (self: super: {
      slstatus = super.slstatus.overrideAttrs (oldAttrs: rec {
        # Lock version
        pname = "slstatus";
        version = "1.0";
        src = pkgs.fetchurl {
          url = "https://dl.suckless.org/tools/${pname}-${version}.tar.gz";
          hash = "sha256-bW0KFsCN2dIRFywwxHIHASZ6P0DNyTjbPzhvaits/1Q=";
        };
        # Inject custom config
        configFile = super.writeText "config.h" (builtins.readFile ./slstatus-config.h);
        postPatch = oldAttrs.postPatch or "" + "\necho 'Using own config file...'\n cp ${configFile} config.def.h";
      });
    })
  ];

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
