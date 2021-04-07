with import
  <nixpkgs>
  { };

stdenv.mkDerivation {
  name =
    "my-app";
  src =
    ./.;

  buildInputs =
    [
      ccls
      cmake
    ];

  buildPhase =
    "c++ -o main main.cpp ";

  installPhase =
    ''
      mkdir -p $out/bin
      cp main $out/bin/
    '';
}
