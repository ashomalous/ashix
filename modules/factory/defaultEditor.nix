{ self, ... }:
{
  flake.factory.defaultEditor = editor: {
    imports = [
      self.modules.nixos.${editor}
    ];

    environment.variables =
      let
        command =
          if editor == "helix" then "hx" else throw "`${editor}` is not a known editor to make defaulted.";
      in
      {
        EDITOR = command;
        VISUAL = command;
      };
  };
}
