let pkgs = import <nixpkgs> { };
in pkgs.mkShell {
  name = "overlay-devenv";
  buildInputs = with pkgs; [
    nixfmt
    nix-prefetch
    nix-prefetch-git
    nix-prefetch-github
    nil
  ];
}
