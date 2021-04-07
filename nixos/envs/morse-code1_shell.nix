with import
  <nixpkgs>
  { };
stdenv.mkDerivation {
  name =
    "env";
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
