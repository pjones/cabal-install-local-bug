let
  nixpkgs = fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/05334ad78526ead39af85f846515606d9f052a11.tar.gz";

  nix-hs = fetchTarball
    "https://github.com/pjones/nix-hs/archive/67163bb02a8791d79136ba6914b6d6dad594533b.tar.gz";
in
{ pkgs ? import nixpkgs { }
, shell ? import "${nix-hs}/nix/shell" { }
}:
shell.overrideAttrs (orig: {
  buildInputs = orig.buildInputs ++ [ pkgs.zlib ];
})
