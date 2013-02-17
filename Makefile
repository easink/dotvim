all: submodules commandt

submodules:
	git submodule foreach git pull origin master
	cd ./bundle/minibufexpl && git pull origin develop

commandt:
	cd ./bundle/command-t/ruby/command-t/ && ruby extconf.rb && make clean all

