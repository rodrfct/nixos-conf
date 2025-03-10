{ pkgs, user1, ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.extraGroups.libvirtd.members = [ user1 ];

  environment.systemPackages = with pkgs; [
    dnsmasq
    bridge-utils
  ];
}
