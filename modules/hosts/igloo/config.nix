{ den, ... }: {
  den.aspects.igloo = {
    includes = with den.aspects; [
      (disk-with-persistence "/dev/nvme0n1" "16G")
      intelDrivers
      (stateVersion "25.05")

      nixos-cli

      systemd-boot

      printing

      zen-browser
      office

      brightness

      pipewire

      bluetooth

      localsend

      mangowc
      waybar
      kitty
      yazi
      mako

      ssh
      firmware
      cli-tools
      comma

      shell

      power-management
      networking
      fonts
      locale
      git

      nix-settings

      # obsidian

      # quickshell
      # pass
      # blender

      # dunst
      # rofi

      # kanata

      # media

      # recording
      # office

      # development

      gaming
      minecraft
      discord

      bibataCursors
      catppuccinGtk

      projects

      ashomaly
    ];
  };
}
