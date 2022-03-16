{ lib, stdenv, fetchFromGitHub, bluez, makeWrapper }:

stdenv.mkDerivation rec {
  pname = "rofi-bluetooth";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "nickclyde";
    repo = "rofi-bluetooth";
    rev = "893db1f2b549e7bc0e9c62e7670314349a29cdf2";
    sha256 = "1jrjiv352awv838v3b6gjjc5rn3kjaagijgn5nky82hhl4j4x16y";
    fetchSubmodules = true;
  };

  nativeBuildInputs = [ makeWrapper ];

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    cp -a rofi-bluetooth $out/bin/rofi-bluetooth
  '';

  wrapperPath = with lib; makeBinPath [ bluez ];

  fixupPhase = ''
    patchShebangs $out/bin

    wrapProgram $out/bin/rofi-bluetooth \
      --prefix PATH : "${wrapperPath}"
  '';

  meta = {
    description = "A script to manage bluetooth with rofi";
    homepage = "https://github.com/nickclyde/rofi-bluetooth";
    license = lib.licenses.gpl3;
    platforms = with lib.platforms; linux;
  };
}
