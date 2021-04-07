with import
  <nixpkgs>
  { };
stdenv.mkDerivation {
  name =
    "snake";
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
