{ pkgs, ... }: 

{
  environment.systemPackages = with pkgs; [ lact ];
  hardware.amdgpu.overdrive.enable = true;
  systemd = {
    packages = with pkgs; [ lact ];
    services.lactd.wantedBy = ["multi-user.target"];
  };
}
