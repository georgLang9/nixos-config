{ config, pkgs, ... }:

{

  imports = [
    ./firefox
    ./nvim
    ./thunderbird
    ./wezterm
    ./zsh
  ];

  home.username = "bonesaw";
  home.homeDirectory = "/home/bonesaw";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  home.sessionVariables = {
    # set default applications
    EDITOR = "nvim";
    BROWSER = "firefox";
    #EDITOR = "vim";
  };


  # Basic configuration of git
  programs.git = {
    enable = true;
    userName = "Bonesaw";
    userEmail = "langgeorg61@gmail.com";
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    discord
    betterdiscordctl
    spotify

    lazygit
  ];

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
    ];
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
