#!/bin/sh
set -ex

opam exec -- ocamlfind ocamlopt -package climate -linkpkg main.ml
