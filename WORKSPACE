workspace(name = "io_tweag_rules_haskell_examples")

local_repository(
    name = "tutorial",
    path = "tutorial",
)

RULES_HASKELL_VERSION = "ea52da0835a1ce28a8d7c141dcb7e3ef936fa54b"
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

http_archive(
    name = "io_bazel_rules_sass",
    strip_prefix = "rules_sass-0.0.3",
    urls = ["https://github.com/bazelbuild/rules_sass/archive/0.0.3.tar.gz"],
)
load("@io_bazel_rules_sass//sass:sass.bzl", "sass_repositories")
sass_repositories()

http_archive(
    name = "io_bazel_skydoc",
    strip_prefix = "skydoc-b374449408e759e32e010fa6a20585fe9fabd523",
    urls = ["https://github.com/mrkkrp/skydoc/archive/b374449408e759e32e010fa6a20585fe9fabd523.tar.gz"],
)
load("@io_bazel_skydoc//skylark:skylark.bzl", "skydoc_repositories")
skydoc_repositories()

register_toolchains("//:ghc")
