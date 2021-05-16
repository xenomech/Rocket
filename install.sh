#! /bin/bash

echo "installing" $1
echo "Proceed ? (y/n)"

add_addon(){
    
}

read $lock

if [[ $lock -eq "y" ]]; then
    echo "backing up the current .bashrc as .bashrc.bak"
    cp ~/.bashrc ~/.bashrc.bak
    if [[ $1 == "p" ]]; then

        new_prompt='[ \u @ \h \W ] [ \d - \@ ] \n~> ' # Plain - no addons

    elif
        [[ $1 == "e" ]]
    then

        new_prompt='📅 \d - 🕡 \@ \n👨‍ \u @ 🛰️ \h : 🌏 \W  \n⚡ ' # Emoji - no addons

    fi
    elif
        [[ $1 == "ex" ]]
    then

        new_prompt='📅 \d - 🕡 \@ \n👨‍ \u @ 🛰️ \h : 🌏 \W  \n⚡ ' # Emoji - no addons

    fi

    sed -i '/^export PS1/s//#&/' ~/.bashrc
    echo "# code injected by Rocket prompt" >>~/.bashrc
    echo "export PS1='$new_prompt'" >>~/.bashrc
fi
