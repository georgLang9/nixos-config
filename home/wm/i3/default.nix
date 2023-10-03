{ pkgs, ... }: 

{
  xsession.windowManager.i3.enable = true;
  home.file.".config/i3/" = {
    source = ./config;
    executable = true;
    recursive = true;
  };

  home.packages = with pkgs; [
    dmenu
    i3status
    i3lock
  ];

  services.picom.enable = true;
} 
