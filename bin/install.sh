#! /bin/zsh

DOTFILES=${HOME}/.dotfiles
export DOTFILES=${DOTFILES}
setopt EXTENDED_GLOB

LINKFILES=(zlogin zlogout zpreztorc)

# Backup old dotfiles directory
if [[ -d ${DOTFILES} ]]; then
  time=`date +%s`
  mv ${DOTFILES} ${HOME}/.dotfiles.$time
fi

git clone -b prezto https://github.com/rockymontana/dotfiles.git ${DOTFILES}
cd ${DOTFILES}
git submodule update --init --recursive

setopt EXTENDED_GLOB
for rcfile in "${DOTFILES}"/vendor/prezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${DOTFILES}/.${rcfile:t}"
done

ln -s ${DOTFILES}/conf/zshrc.conf ${HOME}/.zshrc
ln -s ${DOTFILES}/themes/powerline9k/prompt_powerlevel9k_setup ${DOTFILES}/vendor/prezto/modules/prompt/functions/prompt_powerlevel9k_setup

if [[ "$OSTYPE" == darwin* ]]; then
  sh ./osx.sh
fi
