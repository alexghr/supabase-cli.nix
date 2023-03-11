{ pkgs }:
let
  pname = "supabase-cli";
  version = "1.42.5";
in
pkgs.buildGoModule {
  inherit pname;
  inherit version;

  src = pkgs.fetchFromGitHub {
    owner = "supabase";
    repo = "cli";
    rev = "v${version}";
    sha256 = "sha256-6PYnNEMkj8Ccc+rONjMFJN/ra1gUQF9+EnFoedj0v9g=";
  };

  vendorSha256 = "sha256-4E9ndMmVCo/jjdz9ptj0kGJJmj/uR/MIiW3LxrtcU1E=";
  postInstall = ''
    rm $out/bin/docs $out/bin/listdep

    mv $out/bin/{cli,supabase}
    mv $out/bin/{codegen,supabase-codegen}
  '';
  doCheck = false;
}
