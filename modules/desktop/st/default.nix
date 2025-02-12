{ pkgs, ... }:
{
  # Custom st package
  nixpkgs.overlays = [
    (final: prev: {
      st = prev.st.overrideAttrs (old: {
        src = ./st-flexipatch-b77fb11;
        buildInputs = old.buildInputs ++ [ pkgs.harfbuzz ];
      });
    })
  ];
  environment.systemPackages = with pkgs; [
    st
  ];
  environment.etc = {
    "st-background.ff".source = ./background.ff;
  };
}
