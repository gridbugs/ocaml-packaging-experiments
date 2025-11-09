#!/bin/sh
set -ex


opam exec -- ocamlfind ocamlopt -package unix -package num -linkpkg epoch.ml -o epoch
