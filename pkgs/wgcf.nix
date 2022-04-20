{ lib, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  pname = "wgcf";
  version = "2.2.13";

  src = fetchFromGitHub {
    owner = "ViRb3";
    repo = "wgcf";
    rev = "v${version}";
    sha256 = "14ssj5migsd3i2j290rxc2xrg51sxb5fjj61lcn79xbi9wzy22jz";
  };

  goPackagePath = "github.com/ViRb3/wgcf";

  subPackages = [ "." ];

  meta = with lib; {
    description = "Cross-platform, unofficial CLI for Cloudflare Warp";
    homepage = "https://github.com/ViRb3/wgcf";
    license = licenses.mit;
    # maintainers = with maintainers; [ das-g Br1ght0ne ];
  };
}
