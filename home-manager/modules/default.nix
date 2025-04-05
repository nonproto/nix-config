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
  bash.enable = true;
  git.enable = true;
  vscode.enable = true;

  #home-manager packages
  home.packages = with pkgs; [
    nixd #nix auto complete
    alejandra # nix format
    telegram-desktop
    tldr #command line manual
    android-studio
    android-tools
    discord
    dropbox
    gimp #image editing
    gsmartcontrol #disk info
    kitty #terminal
    inkscape #vector editing
    razergenie #razer mouse ui
    distrobox #have another distro as an image
    boxbuddy #ui for distrobox
    onlyoffice-desktopeditors #office suite
  ];

  #enable directly.  Switch to modules if you start configuring the app.
  programs = {
    google-chrome.enable = true;
    floorp.enable = true;
    vim.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
  };
}
