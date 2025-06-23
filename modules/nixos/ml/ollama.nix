{ config, lib, pkgs, ... }:

{
  imports = [
    ./open-webui.nix
  ];

  # rocm.enable = lib.mkIf (config.hardware.nvidia.modesetting == false) true;

  services = {

    ollama = {
      enable = true;
      package = lib.mkIf config.rocm.enable pkgs.ollama-rocm;
    };

    open-webui.environment.OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";

  };

}
