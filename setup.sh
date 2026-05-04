#!/usr/bin/env bash

# Stop the script if any command fails
set -e

read -p "What is the name of this host? " HOSTNAME

# 1. Create the host directory if it doesn't exist
if [ ! -d "hosts/$HOSTNAME" ]; then
  echo "📁 Creating directory for host $HOSTNAME..."
  mkdir -p "hosts/$HOSTNAME"
fi

# 2. Handle hardware-configuration.nix (local always wins)
echo "⚙️  Copying hardware-configuration.nix from local system (/etc/nixos/)..."
cp /etc/nixos/hardware-configuration.nix "hosts/$HOSTNAME/"
git add "hosts/$HOSTNAME/hardware-configuration.nix"

# 3. Handle configuration.nix (preserve the one from the repo, if it exists)
if [ ! -f "hosts/$HOSTNAME/configuration.nix" ]; then
  echo "📄 configuration.nix not found in repository. Copying from local system..."
  cp /etc/nixos/configuration.nix "hosts/$HOSTNAME/"
  git add "hosts/$HOSTNAME/configuration.nix"
else
  echo "📄 configuration.nix already exists in repository. The Git version will be kept."
fi

# 4. Display final instructions
echo ""
echo "✅ Files successfully generated and configured for host: $HOSTNAME!"
echo ""
echo "🚀 To apply the configuration, copy and paste ONE of the commands below in the terminal:"
echo ""
echo "   sudo nixos-rebuild switch --flake .#$HOSTNAME"
echo ""
