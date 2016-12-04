#!/bin/bash

TODAY=`date +%Y-%m-%d`;
DOTFILES=${HOME}/.dotfiles;
DFBACKUP=${HOME}/dotfiles-${TODAY};
ZSHRC=${HOME}/.zshrc;
DEFAULT="y";
ZSHPACKAGES=(
    "zsh" \
    "zsh-autosuggestions" \
    "zsh-completions" \
    "zsh-git-prompt" \
    "zsh-history-substring-search" \
    "zsh-lovers" \
    "zsh-navigation-tools" \
    "zsh-syntax-highlighting"
);

exists() {
    command -v "$1" &> /dev/null && return 0 || return 1
}

cloneRepos() {
    git clone https://github.com/rockymontana/dotfiles.git $DOTFILES \
        || echo "Could not clone https://github.com/rockymontana/dotfiles.git" && return 1;

    git clone https://github.com/robbyrussell/oh-my-zsh.git $DOTFILES/vendor/oh-my-zsh \
        || echo "Could not clone https://github.com/robbyrussell/oh-my-zsh.git" && return 1;
}

installZSHPackagesWithBrew(){
        echo "No zsh packages was found, however brew was, so I can install the following packages for you:";

        for package in ${ZSHPACKAGES[@]}; do
            echo $package;
        done;
        
        read -p "Should I do that? (Y/n):" -n 1 -rs PROCEED
        PROCEED=${PROCEED:-${DEFAULT}};
        if [ $PROCEED="y" ]; then
            echo \n;
            echo 'Installing...';
            if exists brew; then
                echo "installing ${ZSHPACKAGES[@]}";
                brew install ${ZSHPACKAGES[@]};
                return 0;
            else
                echo "brew is not installed... Aborting...";
                return 0;
            fi
        else
            echo \n;
            echo "Ok, aborting...";
            exit 1;
        fi

    return 1;
}

installComposer() {
    if [ `pwd` != $DOTFILES ]; then
        cd $DOTFILES;
    fi;

    if ! exists composer; then
        echo "Composer is not installed."
        read -p "Should I install it for you? (Y/n):" -n 1 -r
        if [[ ! $REPLY =~ ^[Yy]$ ]] || [ $REPLY -eq 0 ]; then
            echo 'running "brew install composer"';
            brew install composer;
            echo "done installing composer.";
        else
            echo 'Skipping Composer...';
            return 0;
        fi;
    else
        echo "Running composer install";
        composer install;
        return 0;
    fi;
}

backupZshrc() {
    if [ -f $ZSHRC ]; then
        mv $ZSHRC $ZSHRC"-latest";
        return 0;
    fi
}

installDotfiles() {
    if [ ! -d $DOTFILES ]; then
        cloneRepos;
        backupZshrc;
        cd $DOTFILES;
        git checkout -b 2016 origin/2016;

        ln -s $DOTFILES/oh.my.zsh $ZSHRC

        installComposer;

        echo "Changing shell from ${SHELL} to zsh";
        if $SHELL != $zshexec; then
            chsh -s /usr/bin/zsh;
        fi;

        return 0;
    else
        backupZshrc;
        echo "${DOTFILES} is currently populated with something else. Backing up the dir and installing ";
        if [ -d $DFBACKUP ]; then
            DFBACKUP+="-latest";
            if [ -d $DFBACKUP ]; then
                rm -r $DFBACKUP;
            fi;
        fi;

        mv "${DOTFILES}" "${DFBACKUP}";

        echo "Ok. You dotfiles are now copied to ${DFBACKUP}";
        echo "Trying to install again.";
        installDotfiles RESULT;
        echo $RESULT;
        return $RESULT;
    fi

    return 1;
}

if exists "zsh"; then
    if exists "git"; then
        installZSHPackagesWithBrew;
        if [ $? -eq 0 ]; then
            installDotfiles;
            exit $?;
        else
            exit 1;
        fi
    else
        #echo "Git was not found. Start by installing git, then let's talk... Last statement returned $?"
        exit $?;
    fi
fi

exit 1;