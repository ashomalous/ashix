{
  flake.aspects = { aspects, ... }: {
    steamGamescopeSession = {
      includes = with aspects; [
        steam
        gamescope
      ];

      nixos =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        let
          inherit (config.hardware.nvidia.prime.offload) enableOffloadCmd offloadCmdMainProgram;
          steamGamescope = pkgs.writeShellScriptBin "steam-gamescope" ''
            export STEAM_ENABLE_VOLUME_HANDLER=1
            export STEAM_ENABLE_CEC=1
            systemctl --user start steam-gamescope-session.target
            ${lib.getExe' pkgs.pulseaudio "pactl"} set-sink-volume @DEFAULT_SINK@ 50%
            ${lib.optionalString enableOffloadCmd offloadCmdMainProgram} gamescope --steam -- steam -tenfoot &>/dev/null
            systemctl --user stop steam-gamescope-session.target
          '';

          steamGamescopeSession =
            (pkgs.writeTextDir "share/wayland-sessions/steam.desktop"
              # desktop
              ''
                [Desktop Entry]
                Name=Steam
                Comment=A digital distribution platform
                Exec=${lib.getExe steamGamescope}
                Type=Application
              ''
            ).overrideAttrs
              (_: {
                passthru.providedSessions = [ "steam" ];
              });
        in
        {
          services.displayManager.sessionPackages = [ steamGamescopeSession ];

          systemd.user.targets.steam-gamescope-session = {
            description = "Steam (gamescope) session";
            bindsTo = [ "graphical-session.target" ];
            wants = [ "graphical-session-pre.target" ];
            after = [ "graphical-session-pre.target" ];
          };

          systemd.user.services.steam-gamescope-reaper = {
            description = "Monitor and handle steam gamescope session exit requests";
            wantedBy = [ "steam-gamescope-session.target" ];
            partOf = [ "steam-gamescope-session.target" ];
            after = [ "steam-gamescope-session.target" ];

            script = ''
              while sleep 5; do
                if tail -n 10 ~/.steam/steam/logs/console-linux.txt | grep "The name org.freedesktop.DisplayManager was not provided by any .service files$" -q; then
                  echo "Exit request detected, sending shutdown signal"
                  ${lib.getExe config.programs.steam.package} -shutdown
                fi
              done
            '';
          };
        };
    };
  };
}
