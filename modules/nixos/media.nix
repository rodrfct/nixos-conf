{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv
    unar
    qbittorrent
    kdePackages.arianna
    yacreader
    freetube
  ];
}
