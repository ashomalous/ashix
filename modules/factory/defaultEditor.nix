{
  flake.aspects = { aspects, ... }: {
    factory._.defaultEditor = editor: {
      includes = [
        aspects.${editor}
      ];

      nixos.environment.variables =
        let
          command =
            if editor == "helix" then "hx" else throw "`${editor}` is not a known editor to make defaulted.";
        in
        {
          EDITOR = command;
          VISUAL = command;
        };
    };
  };
}
