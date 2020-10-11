function install() {
    echo "mock";
} 

# Runs prior to every test
setup() {
    # Load our script file.
    source ./src/scripts/install.sh
    export -f install
}

@test '1: Get download url binary v0.30.1' {
    export TFSEC_VERSION="v0.30.1"
    result=$(get_download_url)
    [ "$result" == "https://github.com/tfsec/tfsec/releases/download/v0.30.1/tfsec-linux-amd64" ]
}

@test '2: Get download url latest version' {
    export -f install
    export TFSEC_VERSION="latest"
    result=$(get_download_url)
    [ -n "$result" ]
}