{ pkgs ?
  (import
    <nixpkgs>
    { })
, source ?
  ./.
, version ?
  "dev"
}:

with pkgs;

stdenv.mkDerivation rec {
  name =
    "sba-${version}";
  inherit
    version;
  src =
    lib.cleanSource
    source;

  nativeBuildInputs =
    [
      cmake
      pkgconfig
    ];
  buildInputs =
    [
      ceres-solver
      petsc
    ];
}
