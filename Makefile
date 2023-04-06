$(info Starting dot files)

init:
	cp .vimrc ~/.vimrc && \
	cp .zshrc ~/.zshrc && \
	cp .zshrc_env ~/.zshrc_env && \
	cp -rf .zshrc_scripts ~/.zshrc_scripts && \
	cp gitconfig ~/.gitconfig && \
	cp tmux.conf ~/.tmux.conf
