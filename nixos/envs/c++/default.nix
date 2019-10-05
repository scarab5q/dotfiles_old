with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "chippy";
  src = ./.;

  nativeBuildInputs = [
    ccls
    cmake
  ];

  buildPhase = "c++ -o main main.cpp";
}



