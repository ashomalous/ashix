{
  den.aspects.emacs.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      emacs
      ripgrep
      fd
      symbola

      marksman
    ];

    environment.variables = {
      PATH = ["~/.config/emacs/bin"];
    };
  };
}
