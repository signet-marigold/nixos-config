{ inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    age.keyFile = "/home/anhack/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets.yaml;
    validateSopsFiles = false;
  };
}
