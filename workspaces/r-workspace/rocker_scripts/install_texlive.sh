#!/bin/bash
set -e

CTAN_REPO=${1:-${CTAN_REPO:-"https://mirror.ctan.org/systems/texlive/tlnet"}}

ARCH=$(uname -m)

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

cat <<EOF >/tmp/texlive-profile.txt
selected_scheme scheme-infraonly
TEXDIR /usr/local/texlive
TEXMFCONFIG /opt/texlive/texmf-config
TEXMFHOME  /opt/texlive/texmf
TEXMFLOCAL /opt/texlive/texmf-local
TEXMFSYSCONFIG /opt/texlive/texmf-config
TEXMFSYSVAR /opt/texlive/texmf-var
TEXMFVAR /opt/texlive/texmf-var
option_doc 0
option_src 0
EOF

export PATH="${PATH}:/usr/local/texlive/bin/${ARCH}-linux/"

mkdir -p /opt/texlive
# set up packages
apt_install \
    wget \
    perl \
    xzdec

wget "${CTAN_REPO}/install-tl-unx.tar.gz"
tar -xzf install-tl-unx.tar.gz
cd ./install-tl-20*
./install-tl --profile=/tmp/texlive-profile.txt --repository "$CTAN_REPO"
cd ..
rm -rf install-tl-*
rm /tmp/texlive-profile.txt

tlmgr update --self
tlmgr install latex-bin luatex xetex
tlmgr install ae bibtex context inconsolata listings makeindex metafont mfware parskip pdfcrop tex tools url xkeyval

## do not add to /usr/local/bin
# tlmgr path add
# instead, we keep binaries separate and add to PATH
echo "PATH=${PATH}" >>"${R_HOME}"/etc/Renviron.site

## open permissions to avoid needless warnings
NON_ROOT_USER=$(getent passwd "1000" | cut -d: -f1)
if [ -n "$NON_ROOT_USER" ]; then
    chown -R "${NON_ROOT_USER}":staff /opt/texlive
    chown -R "${NON_ROOT_USER}":staff /usr/local/texlive
fi
chmod -R 777 /opt/texlive
chmod -R 777 /usr/local/texlive

# Clean up
rm -rf /var/lib/apt/lists/*

# Check the tlmgr version
echo -e "Check the tlmgr version...\n"
tlmgr --version
echo -e "\nInstall texlive, done!"
