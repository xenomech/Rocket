#! /bin/bash

echo "installing" $1
echo "Proceed ? (y/n)"

read $lock

add_addon_git() {
    echo -e "function gitbranch() { \n git branch 2>/dev/null | grep '^*' | colrm 1 2 | sed -e 's/^/🌲 /' \n }" >>~/.bashrc
}

add_addon_status() {
    echo -e "\n exitstatus() { \n if [[ $? == 0 ]]; then \n\t echo '🤓' \n else \n\t echo '💩'\n fi \n }" >>~/.bashrc
}

if [[ $lock -eq "y" ]]; then
    echo "backing up the current .bashrc as .bashrc.bak"
    cp ~/.bashrc ~/.bashrc.bak
    if [[ $1 == "p" ]]; then
        new_prompt='[ \u @ \h \W ] [ \d - \@ ] \n~> ' # Plain - no addons
    elif
        [[ $1 == "e" ]]
    then
        new_prompt='\n📅 \d - 🕡 \@ \n👨‍ \u @ 🛰️ \h : 🌏 \W  \n⚡ ' # Emoji - no addons
    elif
        [[ $1 == "ex" ]]
    then
        {
            add_addon_git
            new_prompt='\n📅 \d - 🕡 \@ \n👨‍ \u @ 🛰️ \h : 🌏 \W $(gitbranch) $(exitstatus) \n⚡ ' # Emoji - no addons
            add_addon_status
        }
        sed -i '/^export PS1/s//#&/' ~/.bashrc
        echo "# code injected by Rocket prompt" >>~/.bashrc
        echo "export PS1='$new_prompt'" >>~/.bashrc
    fi
fi
