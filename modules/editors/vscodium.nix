{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        #bbenoist.nix
        #ms-python.python
        #ms-azuretools.vscode-docker
        #ms-vscode-remote.remote-ssh
        redhat.java
        vscjava.vscode-java-pack
        vscodevim.vim
        #github.copilot
        ibm.output-colorizer
      ];
    })
  ];
}
