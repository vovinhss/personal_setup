# My Fav Set up

## Configuration
```sh
# Init
sudo apt install unzip -y
# Git 
make git-config
# Or pass values directly:
make git-config GIT_USER="<your_user>" GIT_EMAIL="<your_email>"

# Tmux
echo "set -g mouse-on > ~/.tmux.conf"
tmux source-file ~/.tmux.conf

# ZSH and Plugins
make zsh-install
# Change plugins inside ~/.zshrc to include new plugins, for example:
# plugins=(
#     git
#     zsh-autosuggestions
#     zsh-syntax-highlighting
#     zsh-history-substring-search
# )

# Podman (ubuntu)
sudo apt-get update
sudo apt-get -y install podman

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -f awscliv2.zip aws/

# Install Terraform
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

# Install kubectl cli
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Helm
wget https://get.helm.sh/helm-v4.1.4-linux-amd64.tar.gz
tar -zxvf helm-v4.0.0-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -rf helm-v4.1.4-linux-amd64.tar.gz linux-amd64/
```