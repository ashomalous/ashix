{ den, ... }: {
  den.aspects.defaultEditor = editor: {
    includes = [ den.aspects.${editor} ];

    nixos = { config, ... }: {
      environment.sessionVariables =
        let
          command =
            if (config.ashix.editor ? ${editor}) then
              config.ashix.editor.${editor}.command
            else
              throw "`${editor}` is not a supported default editor as it is missing the `ashix.editor.${editor}` set.";
        in
        {
          EDITOR = command;
          VISUAL = command;
        };
    };
  };

  den.default.nixos = { lib, ... }: {
    options.ashix.editor = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule {
          options.command = lib.mkOption {
            type = lib.types.str;
          };
        }
      );
    };
  };
}
