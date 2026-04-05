#!/usr/bin/env bash

# Update and upgrade before starting
sudo dnf check-update
sudo dnf upgrade -y

# Install basic tools
sudo dnf install @development-tools
sudo dnf install cmake make python3 python3-pip curl -y

# Install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

cat <<EOF | sudo tee /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo dnf check-update

sudo dnf install code -y

# Other utilities
sudo dnf install -y htop fastfetch micro
