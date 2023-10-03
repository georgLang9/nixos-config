{
  pkgs,
  nix-vscode-extensions,
  ...
}:
  let 
    all-extensions = nix-vscode-extensions.extensions.${pkgs.system};
    extensionList = with all-extensions; [ 
      vscode-marketplace.ms-azuretools.vscode-docker
      vscode-marketplace.ms-vscode-remote.remote-containers
    ];
  in 
  {
  # if use vscode in wayland, uncomment this line
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    userSettings = import ./settings.nix {inherit pkgs;};

    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      bbenoist.nix
    ] ++ extensionList ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # Example to add a addon from the marketplace
      # {
      #   name = "remote-ssh-edit";
      #   publisher = "ms-vscode-remote";
      #   version = "0.47.2";
      #   sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      # }
    ];
  };
}
