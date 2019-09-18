#!/bin/bash

set -eux

source ../lib/common.sh

cat > ../manifests/user/cluster-version-operator-secret.yaml <<EOF 
apiVersion: v1
kind: Secret
metadata:
  name: cluster-version-operator
data:
  kubeconfig: $(encode ../pki/admin.kubeconfig)
EOF

envsubst < cluster-version-operator-deployment.yaml > ../manifests/user/cluster-version-operator-deployment.yaml