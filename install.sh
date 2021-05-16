#! /bin/bash

echo "installing" $1
echo "Proceed ? (y/n)"

read $lock

add_addon_git() {
    cat ./addons/git >>~/.bashrc
}

add_addon_git_plain() {
    cat ./addons/git_plain >>~/.bashrc
}

add_addon_status() {
     cat ./addons/exitstat >>~/.bashrc
}

add_addon_status_plain() {
      cat ./addons/exitstat_plain >>~/.bashrc
}

if [[ $lock -eq "y" ]]; then
    echo "backing up the current .bashrc as .bashrc.bak"
    cp ~/.bashrc ~/.bashrc.bak
    sed -i '/^export PS1/s//#&/' ~/.bashrc

    if [[ $1 == "p" ]]; then
        add_addon_git_plain
        add_addon_status_plain
        new_prompt='[ \u @ \h \W ] [ \d - \@ ] $(gitbranch_plain) $(exitstatus) \n~> ' # Plain - no addons
    elif
        [[ $1 == "e" ]]
    then
        {
            add_addon_git
            new_prompt='\n📅 \d - 🕡 \@ \n👨‍ \u @ 🛰️ \h : 🌏 \W $(gitbranch) $(exitstatus) \n⚡ ' # Emoji - no addons
            add_addon_status
        }
    fi
    echo "# code injected by Rocket prompt" >>~/.bashrc
    echo "export PS1='$new_prompt'" >>~/.bashrc
fi
