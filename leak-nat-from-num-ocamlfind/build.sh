#!/bin/sh
set -ex

opam exec -- ocamlfind ocamlopt -package num -linkpkg main.ml
