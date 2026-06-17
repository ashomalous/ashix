{
  den.aspects.gnupg.nixos = {
    programs.gnupg.agent.enable = true;

    persist.user.directories = [
      {
        directory = ".gnupg";
        mode = "0700";
      }
    ];
  };
}
