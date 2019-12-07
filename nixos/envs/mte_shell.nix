with import
  <nixpkgs>
  { };
stdenv.mkDerivation {
  name =
    "mte";
  nativeBuildInputs =
    [
      cmake
      clang
    ];
  buildInputs =
    [
      zeromq
    ];
}
