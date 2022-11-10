{ lib, fetchFromGitHub, cmake, curl, xorg, avahi, qtbase, mkDerivation,
  openssl, wrapGAppsHook,
  avahiWithLibdnssdCompat ? avahi.override { withLibdnssdCompat = true; },
  pkg-config
}:

mkDerivation rec {
  pname = "input-leap";
  version = "master";

  src = fetchFromGitHub {
    owner = "input-leap";
    repo = "input-leap";
    rev = "204238467296e9a9a65e86a1cac74ebfd3d45595";
    sha256 = "kY+dhBWT7tWD551e4HzIGx5Fj0Z7C8xShG0LB/rN+10=";
    fetchSubmodules = true;
  };

  buildInputs = [ curl xorg.libX11 xorg.libXext xorg.libXtst avahiWithLibdnssdCompat qtbase xorg.libXrandr xorg.libXinerama xorg.libICE xorg.libSM xorg.libXdmcp];
  nativeBuildInputs = [ pkg-config cmake wrapGAppsHook ];

  postFixup = ''
    substituteInPlace "$out/share/applications/barrier.desktop" --replace "Exec=barrier" "Exec=$out/bin/barrier"
  '';

  qtWrapperArgs = [
    ''--prefix PATH : ${lib.makeBinPath [ openssl ]}''
  ];

  meta = {
    description = "Open-source KVM software";
    longDescription = ''
      Barrier is KVM software forked from Symless's synergy 1.9 codebase.
      Synergy was a commercialized reimplementation of the original
      CosmoSynergy written by Chris Schoeneman.
    '';
    homepage = "https://github.com/input-leap/input-leap";
    platforms = lib.platforms.linux;
  };
}
