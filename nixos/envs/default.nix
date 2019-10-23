{ lib, stdenv }:

# A special kind of derivation that is only meant to be consumed by the
# nix-shell.
{
  # inputsFrom ? [], # a list of derivations whose inputs will be made available to the environment
  # buildInputs ? [],
  nativeBuildInputs ? [
    pytorch
  ],
  # propagatedBuildInputs ? [],
  # propagatedNativeBuildInputs ? []
}@attrs:
let
  mergeInputs = name:
    let
      op = item: sum: sum ++ item."${name}" or [];
      nul = [];
      list = [attrs] ++ inputsFrom;
    in
      lib.foldr op nul list;
