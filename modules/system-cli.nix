{ den, ... }: {
  den.aspects.system-cli = {
    includes = with den.aspects; [
      system-default

      ssh
      firmware
      cli-tools

      shell

      fonts
    ];
  };
}
