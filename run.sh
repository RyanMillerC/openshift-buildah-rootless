#!/bin/bash

echo "Building ${BUILDER_IMAGE_NAME} locally..."
buildah build -t "${BUILDER_IMAGE_NAME}:latest" .

echo "Pushing ${BUILDER_IMAGE_NAME}..."
skopeo copy "container-storage:${BUILDER_IMAGE_NAME}:latest" \
            "docker://${BUILDER_IMAGE_NAME}:latest"

echo "Adding buildah-sa service account to OpenShift..."
oc apply -f manifests/serviceaccount.yaml

echo "Adding SCC to buildah-sa..."
oc adm policy add-scc-to-user anyuid -z buildah-sa
