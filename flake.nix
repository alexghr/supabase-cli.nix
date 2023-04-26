{
  description = "Patched supabase binary";

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs.url = "nixpkgs/release-22.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  # inputs.flake-utils.

  outputs = { self, nixpkgs, flake-utils }:
    {
      overlays = {
        supabase-cli = final: prev: {
          supabase-cli = self.packages.${prev.system}.supabase-cli;
        };

        default = self.overlays.supabase-cli;
      };
    }
    // flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in rec {
        packages.supabase-cli = import ./supabase-cli.nix { inherit pkgs; };
        packages.default = packages.supabase-cli;
      }
    );
}
