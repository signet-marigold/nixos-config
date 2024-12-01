{ pkgs, ... }:
{
  home.file = {
    ".models/piper/en_US-lessac-high.onnx.json" = {
      source = builtins.fetchurl {
        url = "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/high/en_US-lessac-high.onnx.json";
        sha256 = "0bs1j8d97v6bsvfp82h50a23kckz1scfvf312ny5gwjrk1yvjhnv";
      };
      recursive = true;
    };
    ".models/piper/en_US-lessac-high.onnx" = {
      source = builtins.fetchurl {
        url = "https://huggingface.co/rhasspy/piper-voices/resolve/v1.0.0/en/en_US/lessac/high/en_US-lessac-high.onnx";
        sha256 = "02cyrp5xsr5pr4y892i270zzxm1j4191c5aaycvp209qlv1zgasc";
      };
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    piper-tts
    alsa-utils
    xclip
    dunst
    (writeShellScriptBin "tts-selection" (builtins.readFile ./tts-selection.sh))
  ];
}
