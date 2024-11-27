{ inputs, ... }:
{
  imports = [ inputs.flatpaks.nixosModules.default ];

  services.flatpak = {
    enable = true;
    # https://github.com/GermanBread/declarative-flatpak/blob/dev/docs/definition.md
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      "flathub-beta" = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
    };

    packages = [
      "flathub:app/io.github.nokse22.minitext/x86_64/stable"
      "flathub:app/hu.irl.cameractrls/x86_64/stable"
      "flathub:app/net.mkiol.SpeechNote/x86_64/stable"
      "flathub:app/net.mkiol.SpeechNote.Addon.nvidia//stable"
    ];
  };
}
