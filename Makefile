all: setup git commandt

setup:
	[ -d backup ] || mkdir backup
	[ -d syntax ] || mkdir syntax
	[ -d indent ] || mkdir indent
	[ -d plugin ] || mkdir plugin
	[ -d spell ] || mkdir spell
	[ -d bin ] || mkdir bin
	[ -d doc ] || mkdir doc
	[ -d tmp ] || mkdir tmp

git:
	git submodule foreach git pull origin master
#	cd ./bundle/minibufexpl && git pull origin develop

commandt:
	cd ./bundle/command-t/ruby/command-t/ && ruby extconf.rb && make clean all

