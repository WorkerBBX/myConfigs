#!/bin/bash

# Get current graphics mode and power status
CURRENT_MODE="$(supergfxctl -g)"
CURRENT_STATUS="$(supergfxctl -S)"

# If current graphics mode is 'Integrated' and the current power status is not 'off'
if [[ "$CURRENT_MODE" == *"Integrated"* && "$CURRENT_STATUS" != *"off"* ]]; then
  sleep 4

  # Set graphics mode to Vfio
  supergfxctl -m Vfio
  sleep 1

  # Set graphics mode back to Integrated
  supergfxctl -m Integrated
fi
