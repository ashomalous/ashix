{ inputs, ... }: {
  den.aspects.foot.nixos = {self', ...}: {
    programs.foot.enable = true;
    programs.foot.package = self'.packages.foot;
  };

  perSystem = { pkgs, ... }: {
    packages.foot = inputs.wrappers.wrappers.foot.wrap {
      inherit pkgs;

      settings = {
        main.font = "FiraMono Nerd Font Mono:size=12";
        mouse.hide-when-typing = true;

        colors-dark =
          let
            black = "15161E";
            red = "f7768e";
            green = "9ece6a";
            yellow = "e0af68";
            blue = "7aa2f7";
            magenta = "bb9af7";
            cyan = "7dcfff";
            white = "a9b1d6";

            bright_black = "414868";
            bright_red = "f7768e";
            bright_green = "9ece6a";
            bright_yellow = "e0af68";
            bright_blue = "7aa2f7";
            bright_magenta = "bb9af7";
            bright_cyan = "7dcfff";
            bright_white = "c0caf5";

          in
          {
            foreground = bright_white;
            background = "1a1b26";

            regular0 = black;
            regular1 = red;
            regular2 = green;
            regular3 = yellow;
            regular4 = blue;
            regular5 = magenta;
            regular6 = cyan;
            regular7 = white;

            bright0 = bright_black;
            bright1 = bright_red;
            bright2 = bright_green;
            bright3 = bright_yellow;
            bright4 = bright_blue;
            bright5 = bright_magenta;
            bright6 = bright_cyan;
            bright7 = bright_white;
          };
      };
    };
  };
}
