#!/bin/bash


# Install `just` crate (just)
REPOSITORY_NAME=casey/just
VERSION_RELEASE=$(curl -fsSL https://api.github.com/repos/${REPOSITORY_NAME}/releases | jq '.[0].name' | tr -d '"')

wget -cq https://github.com/${REPOSITORY_NAME}/releases/download/${VERSION_RELEASE}/just-${VERSION_RELEASE}-x86_64-unknown-linux-musl.tar.gz -O - | tar -xz just

# Install `cocogitto` crate (cog)
REPOSITORY_NAME=cocogitto/cocogitto
VERSION_RELEASE=$(curl -fsSL https://api.github.com/repos/${REPOSITORY_NAME}/releases | jq '.[0].name' | tr -d '"')

wget -cq https://github.com/${REPOSITORY_NAME}/releases/download/${VERSION_RELEASE}/cocogitto-5.3.1-x86_64-unknown-linux-musl.tar.gz -O - | tar -xz cog

# Install `cargo-audit` crate (cargo-audit)
REPOSITORY_NAME=rustsec/rustsec
VERSION_RELEASE=$(curl -fsSL https://api.github.com/repos/${REPOSITORY_NAME}/releases | jq '.[0].tag_name' | tr -d '"' | cut -d '/' -f 2)
FOLDER_NAME_RELEASE=cargo-audit-x86_64-unknown-linux-musl-${VERSION_RELEASE}

wget -cq https://github.com/${REPOSITORY_NAME}/releases/download/cargo-audit/${VERSION_RELEASE}/${FOLDER_NAME_RELEASE}.tgz  -O - | tar -xz ${FOLDER_NAME_RELEASE}/cargo-audit
mv ${FOLDER_NAME_RELEASE}/cargo-audit cargo-audit
rm -rf ${FOLDER_NAME_RELEASE}


# Install `jless` crate (jless)
REPOSITORY_NAME=PaulJuliusMartinez/jless
VERSION_RELEASE=$(curl -fsSL https://api.github.com/repos/${REPOSITORY_NAME}/releases | jq '.[0].tag_name' | tr -d '"')
FOLDER_NAME_RELEASE=jless-${VERSION_RELEASE}-x86_64-unknown-linux-gnu.zip

wget -cq https://github.com/${REPOSITORY_NAME}/releases/download/${VERSION_RELEASE}/${FOLDER_NAME_RELEASE}

unzip ${FOLDER_NAME_RELEASE}
rm -rf ${FOLDER_NAME_RELEASE}

# Install Difftastic (`difft`)
CURRENT_REPO="Wilfred/difftastic"
CURRENT_VERSION=$(curl https://api.github.com/repos/${CURRENT_REPO}/releases | jq '.[0].tag_name' | tr -d '"')
wget https://github.com/${CURRENT_REPO}/releases/download/${CURRENT_VERSION}/difft-x86_64-unknown-linux-gnu.tar.gz -O - | zcat - | tar xvf - difft

# Install Watchexec (`watchexec`)
CURRENT_REPO="watchexec/watchexec"
CURRENT_VERSION="$(curl https://api.github.com/repos/${CURRENT_REPO}/releases | jq '.[0].tag_name' | tr -d '"' | cut -c 2-)"
wget https://github.com/${CURRENT_REPO}/releases/download/v${CURRENT_VERSION}/watchexec-${CURRENT_VERSION}-x86_64-unknown-linux-musl.tar.xz -O -  | tar -Jxvf - "watchexec-${CURRENT_VERSION}-x86_64-unknown-linux-musl/watchexec"
mv ./watchexec-${CURRENT_VERSION}-x86_64-unknown-linux-musl/watchexec ./
rm -rf watchexec-${CURRENT_VERSION}-x86_64-unknown-linux-musl
