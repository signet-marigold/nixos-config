{
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "admin+acme@anhack.xyz";
  services.nginx = {
    enable = true;
    virtualHosts = {
      "anhack.xyz" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          root = "/var/www/anhack.xyz";
        };
      };

      "simple.anhack.xyz" = {
        forceSSL = true;
        useACMEHost = "anhack.xyz";
        locations."/" = {
          root = "/var/www/simple.anhack.xyz";
        };
      };
    };
  };
}

