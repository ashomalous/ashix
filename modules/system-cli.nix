{ den, ... }: {
  den.aspects.system-cli = {
    includes = with den.aspects; [
      system-minimal

      ssh
      firmware
      cli-tools
      comma

      shell
    ];
  };
}
