#!/bin/sh

zshrc() {
    echo "==========================================================="
    echo "             cloning gitstatusd                            " 
    echo "-----------------------------------------------------------"
    # Install gitstatusd manually to speed things up and avoid installation prompt in container shell
    mkdir -p ~/.cache/gitstatus && cp ./.cache/gitstatus/gitstatusd-linux-x86_64 ~/.cache/gitstatus/gitstatusd-linux-x86_64 

    echo "==========================================================="
    echo "             cloning zsh-autosuggestions                   "
    echo "-----------------------------------------------------------"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "==========================================================="
    echo "             cloning zsh-syntax-highlighting               "
    echo "-----------------------------------------------------------"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "==========================================================="
    echo "             cloning powerlevel10k                         "
    echo "-----------------------------------------------------------"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo "==========================================================="
    echo "             imports zshrc                                 "
    echo "-----------------------------------------------------------"
    cat .zshrc > $HOME/.zshrc
    echo "==========================================================="
    echo "             imports powerlevel10k                         "
    echo "-----------------------------------------------------------"
    cat .p10k.zsh > $HOME/.p10k.zsh
}

# change time zone
sudo ln -fs /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
sudo dpkg-reconfigure --frontend noninteractive tzdata

zshrc
# zsh