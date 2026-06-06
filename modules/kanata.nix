{
  flake.modules.nixos.kanata = {
    services.kanata.enable = true;

    hardware.uinput.enable = true;

    users.groups.uinput = { };
  };
}
