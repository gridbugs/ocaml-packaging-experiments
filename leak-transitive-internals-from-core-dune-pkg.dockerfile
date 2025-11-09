FROM ubuntu:latest

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y \
    build-essential \
    curl \
    wget \
    git \
    bash \
    unzip \
    opam \
    ;

RUN useradd --create-home --gid users user
WORKDIR /home/user

USER user
RUN opam init --disable-sandbox --auto-setup
RUN opam install -y dune

USER root
COPY --chmod=0755 leak-transitive-internals-from-core-dune-pkg leak-transitive-internals-from-core-dune-pkg
RUN chown -R user leak-transitive-internals-from-core-dune-pkg
USER user
WORKDIR leak-transitive-internals-from-core-dune-pkg
RUN opam exec -- dune build || true

USER root
RUN apt-get install -y neovim
USER user
