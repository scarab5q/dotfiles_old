with import
  <nixpkgs>
  { };

stdenv.mkDerivation {
  # name = "chippy";
  # src = ./.;

  # nativeBuildInputs = [
  #   ccls
  #   cmake
  # ];

  # buildPhase = "c++ -o main main.cpp";
  # }

  name =
    "my-app";
  src =
    ./.;

  buildInputs =
    [
      boost
      poco
      cmake
      pkgconfig
      ccls
    ];

  buildPhase =
    "c++ -o main main.cpp -lPocoFoundation -lboost_system";

  installPhase =
    ''
      mkdir -p $out/bin
      cp main $out/bin/
    '';
}
