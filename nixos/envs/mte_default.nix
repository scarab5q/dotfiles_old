with import <nixpkgs> {};
stdenv.mkDerivation {
  src = ./.;
  name = "mte";
  nativeBuildInputs = [ cmake clang ccls];
  buildInputs = [ zeromq ];

  buildPhase = "c++ -o main src/main.cpp";

  installPhase = ''
    mkdir -p $out/bin
    cp main $out/bin/
  ''

}
