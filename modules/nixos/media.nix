{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv
    video2x
    unar
    qbittorrent
    kdePackages.arianna
    yacreader
  ];
}
