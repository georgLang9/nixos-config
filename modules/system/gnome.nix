# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs.gnome ; [
    baobab        # disk usage analyzer
    cheese        # photo booth
    eog           # image viewer
    epiphany      # web browser
    gedit         # text editor
    simple-scan   # document scanner
    totem         # video player
    yelp          # help viewer
    evince        # document viewer
    file-roller   # archive manager
    geary         # email client
    seahorse      # password manager

    # these should be self explanatory
    gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-contacts
    gnome-logs gnome-maps gnome-music gnome-weather  

    # gnome-system-monitor gnome-disk-utility pkgs.gnome-connections gnome-screenshot
  ];

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "us";
  };
}
