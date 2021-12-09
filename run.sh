#!/bin/bash

buildah build -t "${BUILDER_IMAGE_NAME}:latest" .
skopeo copy "container-storage:${BUILDER_IMAGE_NAME}:latest" \
            "docker://${BUILDER_IMAGE_NAME}:latest"
