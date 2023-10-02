{
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      discord
      betterdiscordctl
      spotify

      unzip
      lazygit

      # languages & tools
      python3
      nodejs
      go
      lua
      typescript

      rustup
      #cargo

      gcc # c/c++ compiler, required by nvim-treesitter!
      llvmPackages.clang-unwrapped # c/c++ tools with clang-tools such as clangd
      cmake
      cmake-language-server
      gnumake

      # language servers
      ccls # c/c++
      gopls
      nodePackages.typescript-language-server
      pkgs.nodePackages.vscode-langservers-extracted # html, css, json, eslint
      nodePackages.yaml-language-server
      sumneko-lua-language-server
      nil # nix
      nodePackages.pyright

      # misc
      tree-sitter

      # formatters and linters
      alejandra # nix
      black # python
      ruff # python
      deadnix # nix
      golangci-lint
      lua52Packages.luacheck
      nodePackages.prettier
      shellcheck
      shfmt
      statix # nix
      stylua
      sqlfluff
      tflint

      # telescope
      fd
      ripgrep
    ];
  };
}

