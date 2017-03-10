if [[ `uname` == 'Darwin' ]]; then
	path=`brew --prefix`

	brews=(
    	"share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
		"share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
		"share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh" \	
	);

	for package in ${brews[@]}; do
    	if [ -f $package ]; then
			source $path/$package;
		fi
	done;

    # Include z
	source $path/etc/profile.d/z.sh
fi

