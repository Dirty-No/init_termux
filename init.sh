#!/bin/sh

pkg update -y && pkg upgrade -y

pkg install vim bash zsh git wget curl openrc netcat -y
echo 'alias vi="vim"' >> ~/.zshrc 
printf "syntax on\nset nu\nset mouse=a" >> ~/.vimrc

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sed -i 's/robbyrussell/pygmalion/g' ~/.zshrc

openrc boot

yes 'root' | passwd

export SERVICE_PORTS="8022"

ifconfig | grep inet && echo "PORTS : $SERVICE_PORTS" && zsh
