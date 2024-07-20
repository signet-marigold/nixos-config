{ pkgs, ... }:

{
  # Install suckless term emulator
  environment.systemPackages = with pkgs; [
    # Require base package for system configuration
    st

    # Build package override
    (st.overrideAttrs (oldAttrs: rec {
      # Build with custom config header file
      configFile = writeText "config.def.h" (builtins.readFile ../sls-headers/st-config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";

      # buildInputs are packages required by one or more patches
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      patches = [
        #./path/to/local.diff
        (fetchpatch {
          url = "https://st.suckless.org/patches/ligatures/0.8.3/st-ligatures-20200430-0.8.3.diff";
          sha256 = "sha256-vKiYU0Va/iSLhhT9IoUHGd62xRD/XtDDjK+08rSm1KE=";
        })
      ];
    }))
  ];
}
