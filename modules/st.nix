{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Build package override
    (st.overrideAttrs (oldAttrs: rec {
      # Lock version
      pname = "st";
      version = "0.9.2";
      src = pkgs.fetchurl {
        url = "https://dl.suckless.org/st/${pname}-${version}.tar.gz";
        hash = "sha256-ayFdT0crIdYjLzDyIRF6d34kvP7miVXd77dCZGf5SUs=";
      };
      # Dependencies
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      # Apply patches
      patches = [
        ./st-patches/st-0.9.2-combinedpatch-20240801-anhack.diff
      ];
      # Inject custom config
      configFile = writeText "config.def.h" (builtins.readFile ../sl-headers/st-config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
    }))

    st
  ];
}
