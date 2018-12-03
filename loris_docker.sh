#!/usr/bin/env bash

docker pull lorisimageserver/loris

SOURCE="${BASH_SOURCE[0]}"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
IMAGEPATH=${DIR}/images
echo ${IMAGEPATH}
docker run --mount src="${IMAGEPATH}",target=/opt/loris/tests/img,type=bind -p 5004:5004 lorisimageserver/loris