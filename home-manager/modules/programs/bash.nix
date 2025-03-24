{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    bash.enable =
      lib.mkEnableOption "enables bash and bashrc";
  };

  config = lib.mkIf config.bash.enable {
    programs.bash = {
      enable = true;
      historySize = 1000000;
      bashrcExtra = ''
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/nonproto-gh
      '';
      shellAliases = {
        ssh-suse = "ssh -A 192.168.86.186";
      };
    };
  };
}
