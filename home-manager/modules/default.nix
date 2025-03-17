{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./programs/bash.nix
    ./programs/git.nix
    ./programs/plasma.nix
    ./programs/vscode.nix
  ];

  #enable module
  plasma.enable = true;
  git.enable = true;
  vscode.enable = true;

  #home-manager packages
  home.packages = with pkgs; [
    nixd
    alejandra
    telegram-desktop
    podman
    podman-compose
    tldr
    android-studio
    discord
    dropbox
    gimp
    kitty
    inkscape
    distrobox
    boxbuddy
    onlyoffice-desktopeditors
  ];

  #enable directly.  Switch to modules if you start configuring the app.
  programs = {
    google-chrome.enable = true;
    floorp.enable = true;
    vim.enable = true;
  };
}
