with import
  <nixpkgs>
  { };

stdenv.mkDerivation {
  name =
    "elm-tut";
  buildInputs =
    [
      nodejs
    ];
  shellHook =
    ''
      export PATH="$PWD/node_modules/.bin/:$PATH"
    '';
}
