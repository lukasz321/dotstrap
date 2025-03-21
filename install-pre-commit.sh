#!/bin/bash

set -e

# Install pre-commit if not already installed
if ! command -v pre-commit &> /dev/null; then
  echo "Installing pre-commit..."
  pip install pre-commit
fi

# Install shfmt+black if not installed
if ! command -v shfmt &> /dev/null; then
  echo "Installing shfmt/black..."
  if [[ $OSTYPE == "darwin"* ]]; then
    brew install shfmt black
  elif [[ -x "$(command -v apt)" ]]; then
    sudo apt-get install shfmt black -y
  else
    echo "shfmt not installed. Install it manually."
    exit 1
  fi
fi

# Create the pre-commit config file
echo "Setting up pre-commit for shfmt/black..."
cat > .pre-commit-config.yaml << EOL
repos:

  - repo: local
    hooks:
      - id: shfmt
        name: shfmt
        entry: shfmt -i 2 -ci -sr -w
        language: system
        files: \.sh$
  - repo: local
    hooks:
      - id: black
        name: black
        entry: black
        language: system
        types: [python]
EOL

# Install and update pre-commit hooks
pre-commit install
pre-commit autoupdate

echo "Setup complete!"
