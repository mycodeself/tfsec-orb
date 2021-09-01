function get_download_url()
{
    if [ -z "$TFSEC_VERSION" ] || [ "$TFSEC_VERSION" = "latest" ]; then
        curl -s https://api.github.com/repos/aquasecurity/tfsec/releases/latest | grep "tfsec-linux-amd64\"$" | grep browser_download_url | cut -d '"' -f 4
    else
        echo "https://github.com/aquasecurity/tfsec/releases/download/${TFSEC_VERSION}/tfsec-linux-amd64"
    fi
}

function install()
{
    echo "Downloading tfsec from $1"
    wget "$1"

    chmod +x tfsec-linux-amd64

    [ -w /usr/local/bin ] && SUDO="" || SUDO=sudo
    $SUDO mv tfsec-linux-amd64 /usr/local/bin/tfsec
}

function main()
{
    install "$(get_download_url)"
}

TEST_ENV="bats-core"
if [ "${0#*$TEST_ENV}" == "$0" ]; then
    main
fi
