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
RUN opam install -y ocamlfind
RUN opam install -y climate

USER root
COPY --chmod=0755 leak-climate-internals-ocamlfind leak-climate-internals-ocamlfind
RUN chown -R user leak-climate-internals-ocamlfind
USER user
WORKDIR leak-climate-internals-ocamlfind


