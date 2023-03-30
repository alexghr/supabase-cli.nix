{ pkgs }:
let
  pname = "supabase-cli";
  version = "1.46.2";
in
pkgs.buildGoModule {
  inherit pname;
  inherit version;

  src = pkgs.fetchFromGitHub {
    owner = "supabase";
    repo = "cli";
    rev = "v${version}";
    sha256 = "sha256-w02rtcEnQbvOif8IJZd2U0Am2Ak5AJEXu0RZuuFFooA=";
  };

  vendorSha256 = "sha256-3X02RBh9kGXybY9ahkraFiROi8PJDIQb888DP2ObBjg=";
  postInstall = ''
    rm $out/bin/docs $out/bin/listdep

    mv $out/bin/{cli,supabase}
    mv $out/bin/{codegen,supabase-codegen}
  '';
  doCheck = false;
}
