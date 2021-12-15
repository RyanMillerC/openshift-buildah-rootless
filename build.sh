#!/bin/bash

echo "Building ${BUILDER_IMAGE_NAME} locally..."
buildah build -t "${BUILDER_IMAGE_NAME}:latest" .

echo "Pushing ${BUILDER_IMAGE_NAME}..."
skopeo copy "container-storage:${BUILDER_IMAGE_NAME}:latest" \
            "docker://${BUILDER_IMAGE_NAME}:latest"
