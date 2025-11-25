
#!/bin/bash

set -euo pipefail

echo "🚀 Installing Gatekeeper..."

kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml

echo "⏳ Waiting for Gatekeeper pods to be ready..."
kubectl wait --for=condition=Available --timeout=180s deployment/gatekeeper-controller-manager -n gatekeeper-system

echo "✅ Gatekeeper installed successfully!"
