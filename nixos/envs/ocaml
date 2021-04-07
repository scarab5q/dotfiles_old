with import <nixpkgs> {};

let
  ocamlPackages = pkgs.recurseIntoAttrs pkgs.ocamlPackages_latest;
in
{
  pkgs.mkShell {
     buildInputs = with pkgs; [
      dune
    ] ++ ( with ocamlPackages;
    [
      ocaml
      core
      core_extended
      findlib
      utop
      merlin
      ocp-indent
    ]);
  }
}
