deploy: link install-deps install-vundle install-plugins install-font

link:
	echo "Linkando o .vimrc do repositorio para ~"
	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

install-deps:
	echo "Instalando as dependencias (root)"
	su -c "apt-get install build-essential git curl vim-gtk vim-nox"

install-vundle:
	echo "Instalando o gerenciador de plugins Vundle"
	mkdir bundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

install-plugins:
	echo "Instalando os plugins no Vim usando o Vundle"
	vim +PluginInstall +qall
	cd ~/.vim/bundle/vimproc.vim 
	make

install-font:
	echo "Instalando a font Fantasque"
	cd ~/.vim/
	mkdir -p ~/.fonts
	cp fonts/* ~/.fonts
	ls ~/.fonts
