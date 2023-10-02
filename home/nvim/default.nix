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
  home.file.".config/lvim/" = {
      source = ./lunarvim;
      recursive = true;
      executable = true;
  };
}
