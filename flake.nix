{
  description = "Patched supabase binary";

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs.url = "nixpkgs/release-22.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  # inputs.flake-utils.

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in rec {
        packages.supabase-cli = import ./supabase-cli.nix { inherit pkgs; };
        packages.default = packages.supabase-cli;
      }
    );
}
