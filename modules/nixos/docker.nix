{ pkgs, user1, ... }:
{
  virtualisation.docker = {
    enable = true;

    extraPackages = with pkgs; [
      docker-compose
    ];
  };

  users.users.${user1}.extraGroups = [ "docker" ];
}
