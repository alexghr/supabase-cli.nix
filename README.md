# supabase.nix

This is flake-based install of the [Supabase CLI].

One off run the CLI:

```shell
nix run github:alexghr/supabase.nix -- --help
```

Add it to your development shell

```nix
# flake.nix
{
  inputs.nixpkgs.url = "nixpkgs/release-22.11";
  inputs.supabase.url = "github:alexghr/supabase.nix";

  outputs = { self, nixpkgs, supabase }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [supabase.packages.${system}.default];
    };
  };
}

```

[Supabase CLI]: https://github.com/supabase/cli
