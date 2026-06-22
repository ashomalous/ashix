{
  den.aspects.helix = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [ helix ];

        persist.user.directories = [ ".config/helix" ];
      };

    hjem =
      { pkgs, lib, ... }:
      let
        toml = pkgs.formats.toml { };
      in
      {
        xdg.config.files."helix/config.toml".source = toml.generate "helix-config.toml" {
          theme = "ayu_dark";

          editor = {
            line-number = "relative";
            mouse = false;
            end-of-line-diagnostics = "hint";

            cursor-shape = {
              insert = "bar";
              normal = "block";
              select = "underline";
            };
            file-picker.hidden = false;
            indent-guides = {
              render = true;
              character = "╎";
              skip-levels = 1;
            };
            inline-diagnostics.cursor-line = "warning";
            statusline = {
              left = [
                "mode"
                "spinner"
              ];
              center = [ "file-name" ];
              right = [
                "diagnostics"
                "selections"
                "position"
                "file-encoding"
                "file-line-ending"
                "file-type"
              ];
              mode.insert = "INSERT";
              mode.normal = "NORMAL";
              mode.select = "SELECT";
              diagnostics = [
                "warning"
                "error"
              ];
              workspace-diagnostics = [
                "warning"
                "error"
              ];
            };
            whitespace.render = "all";
            whitespace.characters = {
              space = "·";
              nbsp = "⍽";
              nnbsp = "␣";
              tab = "→";
              newline = "⏎";
              tabpad = "·"; # ·Tabs·will·look·like·"→···"·(depending·on·tab·width)
            };
          };

          keys = {
            insert.S-tab = "move_parent_node_start";
            normal.tab = "move_parent_node_end";
            normal.S-tab = "move_parent_node_start";
            select.tab = "extend_parent_node_end";
            select.S-tab = "extend_parent_node_start";
          };
        };

        xdg.config.files."helix/languages.toml".source = toml.generate "helix-languages.toml" {
          language = [
            {
              name = "nix";
              auto-format = true;
              # formatter.command = lib.getExe pkgs.alejandra;
            }
          ];

          language-server.nil.command = lib.getExe pkgs.nil;
          language-server.nixd.command = lib.getExe pkgs.nixd;
        };
      };
  };
}
