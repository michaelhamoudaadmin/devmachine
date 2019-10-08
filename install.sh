#!/bin/bash
#setting up a dev machine
apt-get update -y
apt-get install git tmux ruby -y
mkdir code
cd code
git clone https://github.com/michaelhamoudaadmin/devmachine
cd devmachine

#install sudo
apt-get install sudo -y

#add 2GB swap memory
sudo dd if=/dev/zero of=/swapfile bs=1024 count=2097152 && \
sudo chmod 600 /swapfile && \
sudo mkswap /swapfile && \
echo '/swapfile            swap swap    0   0' >> /etc/fstab && \
sudo mount -a && \
sudo swapon -s && \
sudo swapon /swapfile && \
free -h

#install vim
apt-get install vim -y && \
git clone https://github.com/crowdtap/dotfiles ~/.dotfiles && \
cd ~/.dotfiles && \
echo '"Escape key' >> ~/.dotfiles/vimrc && \
echo ':imap jj <Esc>' >> ~/.dotfiles/vimrc && \
echo ':imap jk <Esc>'  >> ~/.dotfiles/vimrc && \
echo ':imap kj <Esc>'  >> ~/.dotfiles/vimrc && \
echo ':nmap Z :wa<CR>'  >> ~/.dotfiles/vimrc && \
echo 'autocmd BufNewFile,BufRead *.tf set syntax=ruby'  >> ~/.dotfiles/vimrc && \
echo "Bundle 'ervandew/screen'" >> ~/.custom.vim-plugins && \
./setup.sh

cd

#install silver searcher
apt-get install silversearcher-ag -y

#install docker
sudo apt-get update -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose

#install terraform
cd /tmp && \
apt-get install wget unzip -y && \
wget https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip && \
mv terraform_0.12.9_linux_amd64.zip /usr/local/bin && \
cd /usr/local/bin && \
unzip terraform_0.12.9_linux_amd64.zip

#linux aliases
echo "alias tf='terraform'" >> ~/.bash_profile
echo "alias tfa='tf apply -auto-approve'" >> ~/.bash_profile
echo "alias tfd='tf destroy -f'" >> ~/.bash_profile

echo "alias wip=\"git add . && git commit -m \"wip\" && git push\"" >> ~/.bash_profile
echo "alias gs='git status'" >> ~/.bash_profile
echo "alias gaa='git add .'" >> ~/.bash_profile
echo "alias gau='git add -u'" >> ~/.bash_profile
echo "alias gc='git commit -m'" >> ~/.bash_profile
echo "alias k='kubectl'" >> ~/.bash_profile

echo "alias d='docker'" >> ~/.bash_profile
echo "alias dc='docker-compose'" >> ~/.bash_profile
echo "alias r='ruby'" >> ~/.bash_profile

echo "alias sbp='source ~/.bash_profile'" >> ~/.bash_profile
echo "alias ebp='vim ~/.bash_profile'" >> ~/.bash_profile
echo "alias cbp='cat ~/.bash_profile'" >> ~/.bash_profile
echo "alias editor=vim" >> ~/.bash_profile

source ~/.bash_profile
