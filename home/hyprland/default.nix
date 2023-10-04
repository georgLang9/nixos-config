{
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland.enable = true;
    #extraConfig = config;
  };

  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  home.file.".config/waybar".source = ./waybar;

  programs.rofi = {
    enable = true;
  };
}
