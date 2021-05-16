# .bashrc

# harnessing return values
exitstatus() {
    if [[ $? == 0 ]]; then
        echo '🤓'
    else
        echo '💩'
    fi
}

# get git branch
function gitbranch() {
    git branch 2>/dev/null | grep '^*' | colrm 1 2 | sed -e 's/^/🌲 /'
}

# code injected by Rocket prompt
export PS1=' 📅 \d - 🕡 \@ \n 👨‍ \u @ 🛰️ \h : 🌏 \W $(gitbranch) $(exitstatus) \n ⚡ '

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# injected by nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH:$NVM_DIR"
fi
export PATH

