{ config, user1, pkgs, inputs, ... }:

{
  imports = [
    ./open-webui.nix
  ];

  systemd.tmpfiles.rules = [
    # This will only create it if it doesn't exist, so contents persist
    "d /llms 0755 root root"
  ];

  services = {

    llama-cpp = {
      enable = true;
      port = 8081;
      # model = "/llms/Qwen_Qwen3-4B-GGUF_Qwen3-4B-Q4_K_M.gguf";
      # model = "/llms/Unsloth-Mistral-24B-Q4-M.gguf";
      model = "/llms/Qwen3-32B-Q3_K_S.gguf";
      # package = inputs.llama-cpp.packages.${pkgs.system}.vulkan;
      extraFlags = [
        "-ngl"
        "100"
        "-c"
        "16384"
        "-t"
        "10"
        "-n"
        "-2"
      ];
      package = pkgs.llama-cpp.override {
        vulkanSupport = true;
      };
    };

    open-webui.environment = {
      OPENAI_API_BASE_URL = "${config.services.llama-cpp.host}:${builtins.toString config.services.llama-cpp.port}/v1";
    };

  };

}
