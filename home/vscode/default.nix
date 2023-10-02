{
  pkgs,
  ...
}: {
  # if use vscode in wayland, uncomment this line
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
    userSettings = {
      "telemetry.enableTelemetry" = false;
      "telemetry.enableCrashReporter" = false;
      "editor.tabSize" = 2;
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontSize" = 16;
      "editor.lineHeight" = 20;
      "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
      "vim.smartRelativeLine" = true;
    };

    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      bbenoist.nix
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
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
