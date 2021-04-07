# { pkgs ? import <nixpkgs> {} }:

# pkgs.mkShell {
#   buildInputs = with pkgs; [
#     # latest.rustChannels.stable.rust
#     latest.rustChannels.nightly.rust
#   ];

#   RUST_BACKTRACE = 0;
# }

# what coc.nvim told me to do
let
  moz_overlay =
    import
    (builtins.fetchTarball
      "https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz");
  nixpkgs =
    import
    <nixpkgs> {
      overlays =
        [
          moz_overlay
        ];
    };
  #rustNightlyChannel = (nixpkgs.rustChannelOf { date = "2019-01-26"; channel = "nightly"; }).rust;
  rustStableChannel =
    nixpkgs.latest.rustChannels.stable.rust.override {
      extensions =
        [
          "rust-src"
          "rls-preview"
          "clippy-preview"
          "rustfmt-preview"
        ];
    };
in with nixpkgs;
stdenv.mkDerivation {
  name =
    "moz_overlay_shell";
  buildInputs =
    [
      rustStableChannel
      rls
      rustup
    ];
}

