{ neovim-unwrapped
, wrapNeovim
, fetchFromGitHub
, stdenv
, makeWrapper
, lib
, ripgrep
, git
, fzf
}:

let
  nvim-customized = wrapNeovim neovim-unwrapped {};
in
stdenv.mkDerivation rec {
  pname = "lunarvim";
  version = "0.0.1";

  src = fetchFromGitHub {
    owner = "LunarVim";
    repo = "LunarVim";
    ref = "master";
    sha256 = lib.fakeSha256;
  };

  nativeBuildInputs = [ makeWrapper nvim-customized ];
  buildInputs = [ nvim-customized ];

  buildPhase = ''
    echo "hello"
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin

    cp -r $(pwd) $out/lvim

    export shim="$out/lvim/utils/bin/lvim"

    substituteInPlace "$shim" \
      --replace "exec nvim" "exec ${nvim-customized}/bin/nvim"

    chmod +x "$shim"

    makeWrapper "$shim" "$out/bin/lvim" \
      --set LUNARVIM_RUNTIME_DIR "$out" \
      --prefix PATH : ${lib.makeBinPath [ fzf git ripgrep ]}
    runHook postInstall
  '';
}