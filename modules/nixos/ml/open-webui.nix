{ config, lib, pkgs, ... }:

{
  allowedUnfreePackages = [
    "open-webui"
  ];

  services = {
    open-webui = {
      enable = true;
      environment = {
        # Disable authentication
        WEBUI_AUTH = "False";
        ANONYMIZED_TELEMETRY= "False";

        ENABLE_WEB_SEARCH = "True";
        WEB_SEARCH_ENGINE = "duckduckgo";
      };
    };

  };

}
