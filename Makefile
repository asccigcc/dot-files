$(info Starting dot files)

init:
	cp vimrc ~/.vimrc && \
	cp zshrc ~/.zshrc && \
	cp zshrc_env ~/.zshrc_env && \
	cp gitconfig ~/.gitconfig && \
	cp tmux.conf ~/.tmux.conf
