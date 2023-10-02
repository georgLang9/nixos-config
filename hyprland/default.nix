{ pkgs, ...}: {
  wayland.windowManager.hyprland.extraConfig = ''
  '';

  home.packages = with pkgs; [
    dunst
  ];

  wayland.windowManager.hyprland.plugins = [
    # Examples of adding plugins:
    # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    # "/absolute/path/to/plugin.so"
  ];
}
