self: super: {
  rofi-scripts = super.callPackage ./pkgs/rofi-scripts { };
  st = super.st.overrideAttrs (_: {
    src = super.fetchFromGithub {
      owner = "yorodm";
      repo = "xst";
      rev = "d4399272c9ba405be63164bfcf4fa13b5b4d71bd";
      sha256 = "ndBXfW57z4Piy3989nxI1sMoxeoOGCsV6Rpza5SV2RY=";
    };
  });
}
