{ pkgs, lib, config, ... }: {

  options = {
    vscode.enable = 
      lib.mkEnableOption "enables vscode";
  };

  config = lib.mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default = {
        extensions = [pkgs.vscode-extensions.jnoortheen.nix-ide];
        userSettings = {
        "files.autoSave" = "onWindowChange";
        "workbench.colorTheme"= "Default Light Modern";
        "editor.formatOnSave"= true;
        "window.zoomLevel"= 0.5;
        "editor.fontSize"= 13;
        "workbench.preferredLightColorTheme" = "Visual Studio Light";
        "nix.enableLanguageServer"= true;
        "nix.serverPath"= "nil";
      };
      }; 
    };
  };
}
