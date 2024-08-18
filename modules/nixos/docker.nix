{ pkgs, ... }: 
{
  virtualisation.docker = {
    enable = true;

    extraPackages = with pkgs; [
      docker-compose
    ];
  };

  users.users.mafiasaurio.extraGroups = [ "docker" ];
}
