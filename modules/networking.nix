{
  den.aspects.networking.nixos = {
    networking.networkmanager.enable = true;

    persist.directories = [ "/etc/NetworkManager/system-connections" ];
  };
}
