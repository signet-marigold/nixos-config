{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aws-sam-cli
    awscli2
    cargo-lambda
    gnumake
    cmake
  ];
}
