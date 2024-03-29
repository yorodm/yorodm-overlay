self: super: {
  rofi-power = super.callPackage ./pkgs/rofi-scripts/rofi-power.nix { };
  rofi-bluetooth = super.callPackage ./pkgs/rofi-scripts/rofi-bluetooth.nix { };
  wgcf = super.callPackage ./pkgs/wgcf.nix {};
  xst = super.st.overrideAttrs (old: {
    # I don't know is this is the right way
    src = super.fetchFromGitHub {
      owner = "gnotclub";
      repo = "xst";
      rev = "d4399272c9ba405be63164bfcf4fa13b5b4d71bd";
      sha256 = "ndBXfW57z4Piy3989nxI1sMoxeoOGCsV6Rpza5SV2RY=";
    };
  });
  input-leap = super.libsForQt5.callPackage ./pkgs/input-leap.nix {};
  proton-ge = super.callPackage ./pkgs/proton-ge.nix {} ;
  st = super.st.overrideAttrs (old: {
    # I don't know is this is the right way
    buildInputs = old.buildInputs ++ [ super.cairo ];
    src = super.fetchFromGitHub {
      owner = "yorodm";
      repo = "st";
      rev = "3f97e54e4374ecfad2a5044367b5348896039dc3";
      sha256 = "WCnmulP09cw/J4OBJd58yKsKZQ0bwryzK9C/4FBTK5c=";
    };
  });
}
