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
RUN opam install -y num

USER root
COPY --chmod=0755 epoch epoch
RUN chown -R user epoch
USER user
WORKDIR epoch


