function install() {
    echo "mock";
} 

# Runs prior to every test
setup() {
    # Load our script file.
    source ./src/scripts/install.sh
    export -f install
}

@test '1: Get download url binary v0.58.6' {
    export TFSEC_VERSION="v0.58.6"
    result=$(get_download_url)
    [ "$result" == "https://github.com/aquasecurity/tfsec/releases/download/v0.58.6/tfsec-linux-amd64" ]
}

@test '2: Get download url latest version' {
    export -f install
    export TFSEC_VERSION="latest"
    result=$(get_download_url)
    [ -n "$result" ]
}