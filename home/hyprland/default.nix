{
  ...
}: {
  wayland.windowManager.hyprland.enable = true;  
  home.file.".config/hypr".source = ./hyprland.conf;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  home.file.".config/waybar".source = ./waybar;

  programs.rofi = {
    enable = true;
  };
}
