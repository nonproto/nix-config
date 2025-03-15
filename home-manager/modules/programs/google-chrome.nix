{ pkgs, lib, config, ... }: {

  options = {
    chrome.enable = 
      lib.mkEnableOption "enables chrome";
  };

  config = lib.mkIf config.chrome.enable {
    programs.google-chrome = {
      enable = true;
    };
  };
} 
