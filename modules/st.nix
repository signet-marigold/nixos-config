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
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      # Apply patches
      patches = [
        #./st-patches/st-boxdraw_v2-0.8.5.diff
        ./st-patches/st-ligatures-20200430-0.8.3.diff
        #./st-patches/st-scrollback-ringbuffer-0.8.5.diff
        #./st-patches/st-scrollback-reflow-0.8.5.diff
        #./st-patches/st-scrollback-mouse-20220127-2c5edf2.diff
      ];
      # Inject custom config
      configFile = writeText "config.def.h" (builtins.readFile ../sl-headers/st-config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
    }))

    st
  ];
}
