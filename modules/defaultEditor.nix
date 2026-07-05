{ den, ... }: {
  den.aspects.defaultEditor = editor: {
    includes = [ den.aspects.${editor} ];

    nixos = _: {
      environment.sessionVariables =
        let
          command =
            if (editor == "helix") then
              "hx"
            else if (editor == "neovim") then
              "nvim"
            else
              throw "`${editor}` is not a supported default editor";
        in
        {
          EDITOR = command;
          VISUAL = command;
        };
    };
  };
}
