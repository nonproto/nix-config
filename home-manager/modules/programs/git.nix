{ pkgs, lib, config, ... }: {

  options = {
    git.enable = 
      lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "nonproto";
      userEmail = "2092019+nonproto@users.noreply.github.com";

    };
  };
} 
