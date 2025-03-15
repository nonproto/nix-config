{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    plasma.enable =
      lib.mkEnableOption "enables plasma";
  };

  config = lib.mkIf config.plasma.enable {
    programs.plasma = {
      enable = true;
      workspace = {
      };
      fonts = {
        general = {
          family = "JetBrains Mono";
          pointSize = 11;
        };
      };
    };
  };
}
