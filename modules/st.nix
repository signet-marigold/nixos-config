{ pkgs, ... }:

{
  # Install suckless term emulator
  environment.systemPackages = with pkgs; [
    # Build package override
    (st.overrideAttrs (oldAttrs: rec {
      # Build with custom config header file
      configFile = writeText "config.def.h" (builtins.readFile ../sl-headers/st-config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";

      # buildInputs are packages required by one or more patches
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      patches = [
        #./st-patches/st-boxdraw_v2-0.8.5.diff
        ./st-patches/st-ligatures-20200430-0.8.3.diff
        #./st-patches/st-scrollback-ringbuffer-0.8.5.diff
        #./st-patches/st-scrollback-reflow-0.8.5.diff
        #./st-patches/st-scrollback-mouse-20220127-2c5edf2.diff
      ];
    }))
    # Require base package for system configuration
    st
  ];
}
