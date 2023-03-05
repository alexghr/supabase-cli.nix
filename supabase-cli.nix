{ pkgs }:
let
  pname = "supabase-cli";
  version = "1.41.6";
in
pkgs.buildGoModule {
  inherit pname;
  inherit version;

  src = pkgs.fetchFromGitHub {
    owner = "supabase";
    repo = "cli";
    rev = "v${version}";
    sha256 = "sha256-t1wM1glZI9xKAG6gCHNMyd2inksAAHzqDoffd80DvNo=";
  };

  vendorSha256 = "sha256-G7QXYaGfw+RI98sMOsChQkp2BR44QF7IIrDkyWQmXq0=";
  postInstall = ''
    rm $out/bin/docs $out/bin/listdep

    mv $out/bin/{cli,supabase}
    mv $out/bin/{codegen,supabase-codegen}
  '';
  doCheck = false;
}
