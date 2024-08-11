{
  programs.git = {
    enable = true;
    userName = "Alex Hack";
    userEmail = "perad@sqwu.me";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      credential = {
        helper = "store";
      };
      pull = {
        rebase = true;
      };
    };
  };
  programs.gitui.enable = true;
  programs.lazygit.enable = true;
}
