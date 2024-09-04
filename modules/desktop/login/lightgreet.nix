{ ... }:

{
  services.xserver = {
    displayManager = {
      lightdm = {
        enable = true;
        autoLogin.timeout = 3;
        greeter.enable = true;
      };
    };
  };
}
