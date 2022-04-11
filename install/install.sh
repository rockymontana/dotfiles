#! /usr/bin/env zsh

DOTFILES=${HOME}/.dotfiles
export DOTFILES=${DOTFILES}
export COMPOSER_HOME=${HOME}/.composer/
setopt EXTENDED_GLOB

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Backup old dotfiles directory
if [[ -d ${DOTFILES} ]]; then
  time=`date +%s`
  mv ${DOTFILES} ${HOME}/.dotfiles.$time
fi

echo 'Cloning dotfiles repo'
git clone https://github.com/rockymontana/dotfiles.git ${DOTFILES}  > /dev/null 2>&1
cd ${DOTFILES}

echo "Done cloning repos"
echo "Setting up submodules"
git submodule update --init --recursive > /dev/null 2>&1

if [[ -f ${HOME}/.zshrc ]]; then
  echo "Backing up ${HOME}/.zshrc to ${HOME}/.zshrc.$time and installing current version"
  mv ${HOME}/.zshrc ${HOME}/.zshrc.${time}
fi
ln -s ${DOTFILES}/conf/zshrc.conf ${HOME}/.zshrc

if [[ -f ${DOTFILES}/vendor/prezto/modules/prompt/functions/prompt_powerlevel9k_setup ]]; then
  rm ${DOTFILES}/vendor/prezto/modules/prompt/functions/prompt_powerlevel9k_setup
fi

 echo 'Symlinking Powerline9k to prezto'
 ln -s $DOTFILES/themes/powerline9k/prompt_powerlevel9k_setup ${DOTFILES}/vendor/prezto/modules/prompt/functions/prompt_powerlevel9k_setup

if [[ "$OSTYPE" == darwin* ]]; then
  echo "Setting up OSX related shananagans"
  composerJSON=${DOTFILES}/composer/composer.osx.json

  # Update Homebrew recipes
  cd ${DOTFILES}/install
  brew update
  brew tap homebrew/bundle
  brew bundle
  sh ${DOTFILES}/install/osx.sh
  cd ${DOTFILES}

elif [[ "$OSTYPE" == linux* ]]; then
  composerJSON = $DOTFILES/composer/composer.nix.json
fi

echo "Installing Composer stuff"
echo "composerJSON = ${composerJSON}"
ln -s $composerJSON ${COMPOSER_HOME}/composer.json
composer global install > /dev/null 2>&1
echo "Everything installed!"

echo "Installing vim stufs"
ln -s ${DOTFILES}/conf/vim/.vimrc ${HOME}/.vimrc
ln -s ${DOTFILES}/conf/vim/.vim_runtime ${HOME}/.vim_runtime

cd ${HOME}
source ${HOME}/.zshrc
