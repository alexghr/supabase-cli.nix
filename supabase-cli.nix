{ pkgs }:
let
  pname = "supabase-cli";
  version = "1.50.14";
in
pkgs.buildGoModule {
  inherit pname;
  inherit version;

  src = pkgs.fetchFromGitHub {
    owner = "supabase";
    repo = "cli";
    rev = "v${version}";
    sha256 = "sha256-LQxqzt4KB6aV2O265gnIAtiHGJnmwuUePWO/EVhI6s4=";
  };

  vendorSha256 = "sha256-j2iEeAn+4Tn3h8lVKoaYE+6W4R/q+JaAWXxHllZGLNs=";
  postInstall = ''
    rm $out/bin/docs $out/bin/listdep

    mv $out/bin/{cli,supabase}
    mv $out/bin/{codegen,supabase-codegen}
  '';
  doCheck = false;
  meta.mainProgram = "supabase";
}
