{ config, ... }:

{
  services.pia = {
    enable = true;
    authUserPass.username = "";
    authUserPass.password = "";
  };
}
