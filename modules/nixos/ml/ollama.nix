{ config, lib, pkgs, ... }:

{
  imports = [
    ../hardware/rocm.nix
  ];

  rocm.enable = lib.mkIf (config.hardware.nvidia.modesetting == false) true;

  allowedUnfreePackages = [
    "open-webui"
  ];

  services = {

    ollama = {
      enable = true;
      package = lib.mkIf config.rocm.enable pkgs.ollama-rocm;
    };

    open-webui = {
      enable = true;
      environment = {
        OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
        # Disable authentication
        WEBUI_AUTH = "False";

        ENABLE_WEB_SEARCH = "True";
        WEB_SEARCH_ENGINE = "duckduckgo";
      };
    };

  };

}
