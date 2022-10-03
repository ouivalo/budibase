#!/bin/bash

tag=$1

if [[ ! "$tag" ]]; then
	echo "No tag present. You must pass a tag to this script"
	exit 1
fi

echo "Tagging images with tag: $tag"

docker tag proxy-service kevinhamon/proxy:$tag
docker tag app-service kevinhamon/apps:$tag
docker tag worker-service kevinhamon/worker:$tag

docker push --all-tags kevinhamon/apps 
docker push --all-tags kevinhamon/worker
docker push --all-tags kevinhamon/proxy
