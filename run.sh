#!/bin/bash

echo "Adding buildah-sa service account to OpenShift..."
oc apply -f manifests/serviceaccount.yaml

echo "Adding SCC to buildah-sa..."
oc adm policy add-scc-to-user anyuid -z buildah-sa
