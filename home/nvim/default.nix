{
  ...
}: {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withPython3 = true;
  };

  # config files 
  home.file.".config/nvim/lua/config" = {
      source = ./lua.;
      recursive = true;
      executable = true;
  };

  # plugins
  home.file.".config/nvim/lua/plugins" = {
      source = ./lua/plugins;
      recursive = true;
      executable = true;
  };
}
