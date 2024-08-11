{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = false;
    vimAlias = true;
    configure = {
      customRC = builtins.readFile ./config/init.vim;
      packages.nix = with pkgs.vimPlugins; {
        start = [
          vim-surround # Shortcuts for setting () {} etc.
          coc-nvim coc-git coc-highlight coc-python coc-rls coc-vetur coc-vimtex coc-yaml coc-html coc-json # auto completion
          vim-nix # nix highlight
          vimtex # latex stuff
          fzf-vim # fuzzy finder through vim
          nerdtree # file structure inside nvim
          rainbow # Color parenthesis
        ];
        opt = [];
      };
    };
  };
}
