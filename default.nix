self: super: {
  rofi-scripts = super.callPackage ./pkgs/rofi-scripts { };
  st = super.st.overrideAttrs (_: {
    src = super.fetchFromGitHub {
      owner = "yorodm";
      repo = "st";
      rev = "3f97e54e4374ecfad2a5044367b5348896039dc3";
      sha256 = "WCnmulP09cw/J4OBJd58yKsKZQ0bwryzK9C/4FBTK5c=";
    };
  });
}
