{ pkgs }:
let
  pname = "supabase-cli";
  version = "1.34.5";
in
pkgs.buildGoModule {
  inherit pname;
  inherit version;

  src = pkgs.fetchFromGitHub {
    owner = "supabase";
    repo = "cli";
    rev = "v${version}";
    sha256 = "sha256-94OZdM9RQ+4dNH/BZGAP5g6zvXHwTdxs7MR2wlJJsZ8=";
  };

  vendorSha256 = "sha256-DgGbZcXQTkvkiTh3PFW3L48rZh5I0MZLGus+N9d1QuU=";
  postInstall = ''
    rm $out/bin/docs $out/bin/listdep

    mv $out/bin/{cli,supabase}
    mv $out/bin/{codegen,supabase-codegen}
  '';
  doCheck = false;
}
