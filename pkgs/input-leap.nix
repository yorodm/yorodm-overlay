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
    repo = pname;
    rev = "1b5aae98e73c840c4108cb1de3d09e3ad620383a";
    sha256 = "Scz+P+opiSOlIYsvLcujNEVuLWO/x+HrCvKlAMqOsTw=";
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
