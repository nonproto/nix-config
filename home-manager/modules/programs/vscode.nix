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
      extension = [pkgs.vscode-extensions.jnoortheen.nix-ide];
      };
    };
  };
}
