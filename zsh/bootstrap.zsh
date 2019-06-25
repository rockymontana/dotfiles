#--------------------------------------
#  Bootstrappin' zsh config stuff
#--------------------------------------
echo "Loading config..."
# If this file isn't included from ~/.zshrc
if [ -z ${DOTFILES} ]; then
	DOTFILES="${HOME}/.dotfiles"
fi

# Prezto needs this
export ZDOTDIR=${DOTFILES}

# powerlevel needs to load some configurations before we init prezto.
# So first of all, we need to load the powerlevel9k configuration.
source ${DOTFILES}/conf/powerlevel9k.conf

# Source Prezto.
if [[ -s "${DOTFILES}/vendor/prezto/init.zsh" ]]; then
	source "${DOTFILES}/vendor/prezto/init.zsh"
fi

# Source default prezto config
if [[ -s "${DOTFILES}/.zpreztorc" ]]; then
  source "${DOTFILES}/.zpreztorc"
fi

# Now it's time to load the prompt autoload and then we should
# initialize it so that we'll be able to use `prompt -s` to
# try themes and save it to the config if it is awesome.
# Last of all we configure the theme from the config.
autoload -Uz promptinit
promptinit
prompt $ZSH_THEME
#echo "prompt ${ZSH_THEME}"
zstyle ':prezto:module:prompt' theme $ZSH_THEME

# Load all zsh-files from $DOTFILES/zsh
for config in ${DOTFILES}/zsh/^bootstrap.zsh(.N); do
  source $config
done

# That's it. We're all done.
echo "All Done! Have fun!"
