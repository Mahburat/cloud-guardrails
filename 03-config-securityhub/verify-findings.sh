#!/bin/bash

set -e

echo "Checking SecurityHub findings..."
aws securityhub get-findings --max-items 5
