{
  den.aspects.locale.nixos = {
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings.LC_TIME = "en_GB.UTF-8";

    location.provider = "geoclue2";
    services.automatic-timezoned.enable = true;
    systemd.services.automatic-timezoned.serviceConfig.Restart = "always";
  };
}
