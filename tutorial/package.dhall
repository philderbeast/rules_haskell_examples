    let defs = ./defaults.dhall

in    defs
    ⫽ { name =
          "tutorial"
      , synopsis =
          "."
      , description =
          "."
      , library =
          { source-dirs = "lib", exposed-modules = "Bool" }
      , executables =
          { demorgans =
              { dependencies =
                  "tutorial"
              , ghc-options =
                  [ "-rtsopts", "-threaded", "-with-rtsopts=-N" ]
              , main =
                  "Main.hs"
              , source-dirs =
                  "main"
              }
          }
      }
