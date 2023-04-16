{ pkgs }:
let
  pname = "supabase-cli";
  version = "1.50.4";
in
pkgs.buildGoModule {
  inherit pname;
  inherit version;

  src = pkgs.fetchFromGitHub {
    owner = "supabase";
    repo = "cli";
    rev = "v${version}";
    sha256 = "sha256-yT47tH6avSdRScRrrAknCh/jmru2a5wlwfHeDV/1/mQ=";
  };

  vendorSha256 = "sha256-PAsmUEw6nI2KTrvPCn2Dxm3mrM6f/O4i8P6P0UuDXzo=";
  postInstall = ''
    rm $out/bin/docs $out/bin/listdep

    mv $out/bin/{cli,supabase}
    mv $out/bin/{codegen,supabase-codegen}
  '';
  doCheck = false;
  meta.mainProgram = "supabase";
}
