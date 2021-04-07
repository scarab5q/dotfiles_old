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
      boost
      poco
    ];

  buildPhase =
    "c++ -o main main.cpp -lPocoFoundation -lboost_system";

  installPhase =
    ''
      mkdir -p $out/bin
      cp main $out/bin/
    '';
}
