# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/locales.nix
      ../../modules/network.nix
      ../../modules/nix-settings.nix
      ../../modules/packages.nix
      ../../modules/shell.nix
      ../../modules/sound.nix
      ../../modules/system/system.nix
      ../../modules/system/gnome.nix
      ../../modules/system/i3/i3.nix
      ../../modules/user.nix
    ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    systemd-boot.enable = true;
    systemd-boot.editor = false;
    systemd-boot.configurationLimit = 10;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  system.stateVersion = "23.05"; # Did you read the comment?
}
