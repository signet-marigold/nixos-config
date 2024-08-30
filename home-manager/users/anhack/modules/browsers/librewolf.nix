{
  programs.librewolf = {
    enable = true;
    # Enable WebGL, cookies and history
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = true;
      "privacy.clearOnShutdown.history" = true;
      "privacy.clearOnShutdown.cookies" = true;
      "network.cookie.lifetimePolicy" = 0;
    };
  };
}
