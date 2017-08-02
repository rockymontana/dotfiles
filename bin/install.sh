#! /bin/zsh

DOTFILES=${HOME}/.dotfiles
export DOTFILES=${DOTFILES}
set -o EXTENDED_GLOB

# Backup old dotfiles directory
if [[ -d ${DOTFILES} ]]; then
  time=`date +%s`
  mv ${DOTFILES} ${HOME}/.dotfiles.$time
fi

echo 'Cloning dotfiles repo'
git clone -b prezto https://github.com/rockymontana/dotfiles.git ${DOTFILES}  > /dev/null 2>&1
cd ${DOTFILES}
echo "Done cloning repos"
echo "Setting up submodules"
git submodule update --init --recursive > /dev/null 2>&1

for rcfile in "${DOTFILES}"/vendor/prezto/runcoms/^README.md(.N); do
  cp "$rcfile" "${DOTFILES}/zsh/.${rcfile:t}.zsh"
done

if [[ -f ${HOME}/.zshrc ]]; then
  echo "Backing up ${HOME}/.zshrc to ${HOME}/.zshrc.$time and installing current version"
  mv ${HOME}/.zshrc ${HOME}/.zshrc.${time}
fi
ln -s ${DOTFILES}/conf/zshrc.conf ${HOME}/.zshrc

if [[ -f ${DOTFILES}/vendor/prezto/modules/prompt/functions/prompt_powerlevel9k_setup ]]; then
  rm ${DOTFILES}/vendor/prezto/modules/prompt/functions/prompt_powerlevel9k_setup
fi
ln -s ${DOTFILES}/themes/powerline9k/prompt_powerlevel9k_setup ${DOTFILES}/vendor/prezto/modules/prompt/functions/prompt_powerlevel9k_setup

if [[ "$OSTYPE" == darwin* ]]; then
  echo "Setting up OSX related shananagans"
  sh ./osx.sh
fi

echo "Everything installed!"
source ${HOME}/.zshrc
