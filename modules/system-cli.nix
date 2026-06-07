{
  flake.aspects = { aspects, ... }: {
    system-cli = {
      includes = with aspects; [
        system-default

        ssh
        firmware
        cli-tools

        shell

        fonts
      ];
    };
  };
}
