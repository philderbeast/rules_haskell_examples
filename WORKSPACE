workspace(name = "io_tweag_rules_haskell_examples")

local_repository(
    name = "tutorial",
    path = "tutorial",
)

RULES_HASKELL_VERSION = "18a37091a23806ad3dd42867b3ec62b9b4b4eaea"
http_archive(
    name = "io_tweag_rules_haskell",
    strip_prefix = "rules_haskell-{}".format(RULES_HASKELL_VERSION),
    urls = ["https://github.com/tweag/rules_haskell/archive/{}.tar.gz".format(RULES_HASKELL_VERSION)],
)

load("@io_tweag_rules_haskell//haskell:repositories.bzl", "haskell_repositories")

haskell_repositories()

http_archive(
    name = "io_tweag_rules_nixpkgs",
    strip_prefix = "rules_nixpkgs-0.2",
    urls = ["https://github.com/tweag/rules_nixpkgs/archive/v0.2.tar.gz"],
)

load(
    "@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl",
    "nixpkgs_git_repository",
    "nixpkgs_package",
)

nixpkgs_git_repository(
    name = "nixpkgs",
    revision = "18.03",
)

nixpkgs_package(
    name = "ghc",
    # For rts example. Not needed if you're not using the RTS directly.
    build_file = "@io_tweag_rules_haskell//haskell:ghc.BUILD",
    # For vector example. Just use `attribute_path = haskell.compiler.ghc822`
    # when no extra packages needed.
    nix_file_content = """
  let pkgs = import <nixpkgs> {}; in
  pkgs.haskell.packages.ghc822.ghcWithPackages (p: with p;
    [primitive semigroupoids]
  )
  """,
    repository = "@nixpkgs",
)

register_toolchains("//:ghc")
