{ pkgs, ... }: {
  xsession.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3status
      i3lock
    ];

    config = {
      fonts = [ "ComicShannsMono"];
    };

  };

  services.picom.enable = true;
} 
