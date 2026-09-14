{ inputs, ... }: {
  den.aspects.zsh.nixos = { self', ... }: {
    nixpkgs.overlays = [
      (_: _: {
        zsh = self'.packages.zsh;
      })
    ];
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      histSize = 10000;
    };
  };

  perSystem =
    {
      self',
      pkgs,
      lib,
      ...
    }:
    {
      packages.zsh = inputs.wrappers.wrappers.zsh.wrap {
        inherit pkgs;
        runtimePkgs = [
          pkgs.carapace
          pkgs.devenv
          pkgs.fzf
        ];
        zshAliases = {
          ls = "${lib.getExe pkgs.lsd}";
          cat = "${lib.getExe pkgs.bat}";
          man = "man -P \"${lib.getExe pkgs.bat} -p\"";
        };
        zshrc.content = # zshrc
          ''
            autoload -U compinit && compinit
            export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
            source <(${lib.getExe pkgs.carapace} _carapace)

            source <(${lib.getExe pkgs.fzf} --zsh)

            ${lib.getExe pkgs.any-nix-shell} zsh --info-right | source /dev/stdin

            eval "$(${lib.getExe self'.packages.oh-my-posh} init zsh)"

            eval "$(${lib.getExe pkgs.devenv} hook zsh)"
          '';
      };
    };
}
