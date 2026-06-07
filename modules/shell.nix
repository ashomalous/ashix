{
  flake.aspects.shell.nixos = {
    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      enableCompletion = true;
      enableLsColors = true;
      syntaxHighlighting.enable = true;
    };

    programs.bash = {
      enable = true;
      completion.enable = true;
      enableLsColors = true;
    };
  };
}
