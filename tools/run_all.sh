#!/bin/env bash
set -e

trap "docker kill target &> /dev/null || docker rm target &> /dev/null" SIGINT

repo="ghcr.io/greenbone/vt-test-environments"
name=$1
command=${*:2}

if [[ -z $name ]]
then
    echo "$0: Run all test environments"
    echo "Usage: $0 IMAGE [command ...]"
    echo ""
    echo "Examples:"
    echo "Run \"dpkg --version\" it every Ubuntu environment:"
    echo -e "\t$0 ubuntu dpkg --version"
    echo "Run every Debian environment for scanning via SSH, one after another:"
    echo -e "\t $0 debian"
    exit 1
fi

echo ">> Pulling all $name images"
docker pull -a "$repo/$name"
images=$(docker images "$repo/$name" --format "{{ .Repository }}:{{ .Tag }}" | grep -v ":<none>$")

for image in $images
do
    echo ">> Running $image"
    if [[ -z $command ]]
    then
        docker run -p 2222:22 --name target -d "$image"
        read -p ">> Press enter to stop container and continue with next one"
        docker kill target > /dev/null
    else
        docker run --name target -it "$image" $command
    fi
    docker rm target > /dev/null
done
