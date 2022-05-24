{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "wgcf";
  version = "2.2.13";

  src = fetchFromGitHub {
    owner = "yorodm";
    repo = pname;
    rev =  "05e37fe11979356e2513e91093fc463b7e1fe42c";
    sha256 = "0s7qxxyb8295zj4lmszw3illyfzfr58gv5zrjgvx6zbkrjqkbmjv";
  };

  vendorSha256 = null;
  subPackages = [ "." ];

  meta = with lib; {
    description = "Cross-platform, unofficial CLI for Cloudflare Warp";
    homepage = "https://github.com/ViRb3/wgcf";
    license = licenses.mit;
    # maintainers = with maintainers; [ das-g Br1ght0ne ];
  };
}
