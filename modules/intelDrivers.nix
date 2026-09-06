{
  den.aspects.intelDrivers.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      mesa
      vulkan-tools
    ];
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-vaapi-driver
        libva-vdpau-driver
      ];
    };
  };
}
