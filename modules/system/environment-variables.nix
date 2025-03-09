{ pkgs, ... }:
{
  # Setup Env Variables
  #environment.variables.SPOTIFY_PATH = "${pkgs.spotify}/";
  #environment.variables.JDK_PATH = "${pkgs.jdk11}/";
  #environment.variables.NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";

  # https://www.reddit.com/r/tauri/comments/16tzsi8/tauri_desktop_app_not_rendering_but_web_does/
  #   webkitgtk 2.42 is broken for all(?) users of propitary
  # nvidia drivers because of its new renderer. You can disable
  # it with an env var:
  environment.variables.WEBKIT_DISABLE_DMABUF_RENDERER = "1";

  environment.sessionVariables = {
    EDITOR = "nvim";
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
  };
}
