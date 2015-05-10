deploy: link install-deps install-vundle install-plugins

link:
	echo "Linkando o .vimrc do repositorio para ~"
	ln -s ~/.vim/.vimrc ~/.vimrc

install-deps:
	echo "Instalando as dependencias (root)"
	su -c "aptitude install build-essential git curl"

install-vundle:
	echo "Instalando o gerenciador de plugins Vundle"
	mkdir bundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

install-plugins:
	echo "Instalando os plugins no Vim usando o Vundle"
	vim +PluginInstall +qall
	cd ~/.vim/bundle/vimproc.vim 
	make
