# Package

version       = "0.1.0"
author        = "Leastrio"
description   = "An LCU wrapper for Nim"
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.6.10"
requires "https://github.com/khchen/winim >= 3.9.0"

# Stolen from dimscord
task docs, "Generates the documentation for dimscord":
    rmDir("docs") # Clean old doc folder
    exec("nim doc2 --outdir=docs --project --index:on -d:ssl --git.url:https://github.com/leastrio/nimdred --git.commit:main src/nimdred.nim")
    exec("nim buildindex -o:docs/theindex.html docs/") # This builds the index to allow search to work