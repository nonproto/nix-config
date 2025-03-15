{ pkgs, lib, ...}: {
  imports = [
    ./programs/git.nix
  ];
  #enable module
  git.enable = true;

  #enable directly.  Switch to modules if you start configuring the app.
  programs =  {
  google-chrome.enable = true;
  floorp.enable = true;
  vscode.enable = true;
  vim.enable = true;
};

}
