#!/bin/bash

# List of packages to install before building Janus
packagelist=(
    git
    wget
    libmicrohttpd-dev
    libjansson-dev
    libssl-dev
    libsofia-sip-ua-dev
    libglib2.0-dev
    libopus-dev
    libogg-dev
    libcurl4-openssl-dev
    liblua5.3-dev
    libconfig-dev
    zlib1g
    pkg-config
    gengetopt
    libtool
    automake
    gtk-doc-tools
    cmake
    ca-certificates
    meson
    ninja-build
    make 
    gengetopt 
	pkg-config 
	automake 
	libtool 
	cmake 
	build-essential
	gtk-doc-tools
	libconfig-dev
    psmisc
)

# Bash "strict mode", to help catch problems and bugs in the shell
# script. Every bash script you write should include this. See
# http://redsymbol.net/articles/unofficial-bash-strict-mode/ for
# details.
set -euo pipefail

# Tell apt-get we're never going to be able to give manual
# feedback:
export DEBIAN_FRONTEND=noninteractive

# Update the package listing, so we know what package exist:
apt-get update

# Install security updates:
apt-get -y upgrade

# Install a new package, without unnecessary recommended packages:
apt-get -y install --no-install-recommends ${packagelist[@]}
