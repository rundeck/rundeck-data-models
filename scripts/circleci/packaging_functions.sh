
fetch_ci_shared_resources() {
    # Get ci resources.
    aws s3 sync --delete "${S3_CI_SHARED_RESOURCES}" ci-resources

    echo "Retrieved resources from AWS!! "
    ls -la ci-resources

    # install gpg keys.
    mkdir -p "${HOME}/.gnupg"
    cp -pv ci-resources/* "${HOME}/.gnupg/"
    chmod -R 700 "${HOME}/.gnupg"
}

packaging_publish_maven() {

    DRY_RUN=${DRY_RUN:-false}

    fetch_ci_shared_resources

    ./gradlew ${GRADLE_BASE_OPTS} \
        -Penvironment="${ENV}" \
        -Psigning.secretKeyRingFile="$(realpath "${HOME}/.gnupg/secring.gpg")" \
        -Psigning.password="${RUNDECK_SIGNING_PASSWORD}" \
        -Psigning.keyId="${RUNDECK_SIGNING_KEYID}" \
        -PsigningPassword="${RUNDECK_SIGNING_PASSWORD}" \
        -PsonatypeUsername="${SONATYPE_USERNAME}" \
        -PsonatypePassword="${SONATYPE_PASSWORD}" \
        publishToSonatype closeSonatypeStagingRepository
}