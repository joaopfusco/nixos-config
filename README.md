# 🐧 NixOS com Flakes & Home Manager

## ⚙️ Pré-requisitos

1. **Git** configurado e repositório com:
   - `flake.nix` (descrição de inputs e outputs)
   - `hosts/<nome-do-host>/configuration.nix` (configuração global do sistema por host)
   - `hosts/<nome-do-host>/hardware-configuration.nix` (configurações do hardware do sistema por host)
   - `home.nix` (configuração do Home Manager)

2. **Clone** do repositório atual:
   ```bash
   # Instale o git temporariamente
   nix-shell -p git
   
   # Clone o repositório
   git clone https://github.com/joaopfusco/nixos-config.git

   # Entre no diretório
   cd nixos-config
   ```

---

## 🛠 Comandos Principais

| Ação                             | Comando                                                                    |
|----------------------------------|----------------------------------------------------------------------------|
| Build & Switch                   | `nixos-rebuild switch --flake .#nixos-vm`                                  |
| Build sem restart                | `nixos-rebuild build --flake .#nixos-vm && result/bin/switch-to-configuration switch` |
| Testar (dry-run)                 | `nixos-rebuild test --flake .#nixos-vm`                                    |
| Aplicar Home Manager             | `home-manager switch --flake .#joaop`                                       |
| Atualizar Flake Lock             | `nix flake update`                                                         |

---

## 🔄 Atualização e Gerenciamento

```bash
# Sincronize com o repositório remoto
git pull origin main

# Atualize inputs do Flake
nix flake update

# Rebuild e switch do sistema (sudo)
sudo nixos-rebuild switch --flake .#nixos-vm

# Reaplique configurações do usuário (Home Manager)
home-manager switch --flake .#joaop
```

---