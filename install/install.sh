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
ln -s ${DOTFILES}/conf/mackup.cgf ${HOME}/.mackup.cfg

if [[ "$OSTYPE" == darwin* ]]; then
  echo "Setting up OSX related shenanigans"
  composerJSON=${DOTFILES}/composer/composer.osx.json

  # Update Homebrew recipes
  cd ${DOTFILES}/install
  brew update
  brew tap homebrew/bundle
  brew bundle
  sh ${DOTFILES}/install/osx.sh
  brew install romkatv/powerlevel10k/powerlevel10k
  cd ${DOTFILES}

elif [[ "$OSTYPE" == linux* ]]; then
  composerJSON = $DOTFILES/composer/composer.nix.json
fi

echo "Installing Composer stuff"
echo "composerJSON = ${composerJSON}"
ln -s $composerJSON ${COMPOSER_HOME}/composer.json
composer global install > /dev/null 2>&1

echo "Installing vim stuff"
ln -s ${DOTFILES}/conf/vim/.vimrc ${HOME}/.vimrc
ln -s ${DOTFILES}/conf/vim/.vim_runtime ${HOME}/.vim_runtime

echo "Everything installed!"
source ${HOME}/.zshrc
