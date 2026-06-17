{
  den.aspects.ssh.nixos = {
    services.openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PasswordAuthentication = true;
        PermitRootLogin = "yes";
      };
    };

    persist = {
      directories = [ "/etc/ssh" ];
      user.directories = [
        {
          directory = ".ssh";
          mode = "0700";
        }
      ];
    };
  };
}
