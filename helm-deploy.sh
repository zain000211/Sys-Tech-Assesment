#!/bin/bash

NAMESPACE="java-app"
RELEASE_NAME="java-app"
CHART_DIR="./helm-chart"
VALUES_FILE="./helm-chart/values.yaml"


function check_requirements() {
  echo "Checking prerequisites..."

  if ! command -v helm &> /dev/null; then
    echo "Helm is not installed. Please install Helm and try again."
    exit 1
  fi

  if ! command -v kubectl &> /dev/null; then
    echo "kubectl is not installed. Please install kubectl and try again."
    exit 1
  fi
}

function create_namespace() {
  echo "Creating namespace if it does not exist..."
  kubectl get namespace "$NAMESPACE" &> /dev/null
  if [ $? -ne 0 ]; then
    kubectl create namespace "$NAMESPACE"
    echo "Namespace $NAMESPACE created."
  else
    echo "Namespace $NAMESPACE already exists."
  fi
}

function deploy_chart() {
  echo "Deploying Helm chart..."

  helm upgrade --install "$RELEASE_NAME" "$CHART_DIR" \
    --namespace "$NAMESPACE" \
    -f "$VALUES_FILE"

  if [ $? -eq 0 ]; then
    echo "Helm chart deployed successfully!"
  else
    echo "Failed to deploy Helm chart."
    exit 1
  fi
}

function verify_deployment() {
  echo "Verifying deployment..."

  echo "Checking pods in the namespace $NAMESPACE:"
  kubectl get pods -n "$NAMESPACE"

  echo "Checking services in the namespace $NAMESPACE:"
  kubectl get svc -n "$NAMESPACE"

  echo "Checking PersistentVolumeClaims in the namespace $NAMESPACE:"
  kubectl get pvc -n "$NAMESPACE"

  echo "Checking PersistentVolumes:"
  kubectl get pv
}


check_requirements
create_namespace
deploy_chart
verify_deployment

echo "Deployment complete!"
