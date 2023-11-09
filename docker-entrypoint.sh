#!/bin/bash

# Default values
HOSTNAME=${HOSTNAME:-0.0.0.0}
PORT=${PORT:-3000}
UDS_PATH=${UDS_PATH:-/tmp/text-embeddings-inference-server}
HUGGINGFACE_HUB_CACHE=${HUGGINGFACE_HUB_CACHE:-/data}
JSON_OUTPUT=${JSON_OUTPUT:-false}
OTLP_ENDPOINT=${OTLP_ENDPOINT:-}
CORS_ALLOW_ORIGIN=${CORS_ALLOW_ORIGIN:-}

# Array to store unrecognized arguments
OTHER_ARGS=()

# Parse command line arguments
while (( "$#" )); do
  case "$1" in
    --hostname)
      HOSTNAME=$2
      shift 2
      ;;
    --port)
      PORT=$2
      shift 2
      ;;
    --uds-path)
      UDS_PATH=$2
      shift 2
      ;;
    --huggingface-hub-cache)
      HUGGINGFACE_HUB_CACHE=$2
      shift 2
      ;;
    --json-output)
      JSON_OUTPUT=$2
      shift 2
      ;;
    --otlp-endpoint)
      OTLP_ENDPOINT=$2
      shift 2
      ;;
    --cors-allow-origin)
      CORS_ALLOW_ORIGIN=$2
      shift 2
      ;;
    *)
      OTHER_ARGS+=("$1")
      shift
      ;;
  esac
done

# Pass the parameters to the executable
text-embeddings-router --hostname $HOSTNAME --port $PORT --uds-path $UDS_PATH --huggingface-hub-cache $HUGGINGFACE_HUB_CACHE --json-output $JSON_OUTPUT --otlp-endpoint $OTLP_ENDPOINT --cors-allow-origin $CORS_ALLOW_ORIGIN "${OTHER_ARGS[@]}"
