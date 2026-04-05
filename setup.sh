#!/usr/bin/env bash

# Para o script se qualquer comando falhar
set -e

read -p "Qual é o nome deste host? " HOSTNAME

# 1. Cria a pasta do host se não existir
if [ ! -d "hosts/$HOSTNAME" ]; then
  echo "📁 Criando diretório para o host $HOSTNAME..."
  mkdir -p "hosts/$HOSTNAME"
fi

# 2. Lida com o hardware-configuration.nix (O local sempre manda)
echo "⚙️  Copiando hardware-configuration.nix do sistema local (/etc/nixos/)..."
cp /etc/nixos/hardware-configuration.nix "hosts/$HOSTNAME/"
git add "hosts/$HOSTNAME/hardware-configuration.nix"

# 3. Lida com o configuration.nix (Preserva o do repositório, se existir)
if [ ! -f "hosts/$HOSTNAME/configuration.nix" ]; then
  echo "📄 configuration.nix não encontrado no repositório. Copiando do sistema local..."
  cp /etc/nixos/configuration.nix "hosts/$HOSTNAME/"
  git add "hosts/$HOSTNAME/configuration.nix"
else
  echo "📄 configuration.nix já existe no repositório. A versão do Git será mantida."
fi

# 4. Exibe as instruções finais
echo ""
echo "✅ Arquivos gerados e configurados com sucesso para o host: $HOSTNAME!"
echo ""
echo "🚀 Para aplicar a configuração, copie e cole UM dos comandos abaixo no terminal:"
echo ""
echo "👉 Se esta máquina for NixOS:"
echo "   sudo nixos-rebuild switch --flake .#$HOSTNAME"
echo ""
echo "👉 Se esta máquina for Standalone (Ubuntu, Fedora, WSL, etc):"
echo "   home-manager switch --flake .#joaop@$HOSTNAME"
echo ""