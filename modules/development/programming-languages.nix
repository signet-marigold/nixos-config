{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    go
    (python312Full.withPackages(ps: with ps; [ pygobject3 gobject-introspection pyqt6-sip ]))
    nodePackages.nodejs
    nodePackages.pnpm
    bun
    lua
    zig
    numbat
  ];
}
