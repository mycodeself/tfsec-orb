
download_url=""

if [ -z "$TFSEC_VERSION" ] || [ $TFSEC_VERSION = "latest" ]; then
    download_url=$(curl -s https://api.github.com/repos/tfsec/tfsec/releases/latest | grep tfsec-linux-amd64 | grep browser_download_url | cut -d '"' -f 4)
else
    download_url="https://github.com/tfsec/tfsec/releases/download/${TFSEC_VERSION}/tfsec-linux-amd64"
fi

echo "Downloading tfsec from ${download_url}"
wget $download_url

chmod +x tfsec-linux-amd64

[ -w /usr/local/bin ] && SUDO="" || SUDO=sudo
$SUDO mv tfsec-linux-amd64 /usr/local/bin/tfsec
