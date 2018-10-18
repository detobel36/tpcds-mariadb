TPC_URL=https://owncloud.ulb.ac.be/index.php/s/v6BsCennyblD6OQ/download

all: install extract patch

install:
	sudo apt-get install wget git

install_database:
        sudo apt-get install mariadb-server

extract:
	git clone https://github.com/gregrahn/tpcds-kit.git

patch:
	./patch-tpcds-kit.sh


clean: clear

clear:
	rm -rf tpcds-kit

help:
	@echo "--- Help of this Makefile ---"
	@echo ""
	@echo "make install"
	@echo "\tTo install all software"
	@echo ""
	@echo "make extract"
	@echo "\tTo download and unzip TPC-DS files"
	@echo ""
	@echo "make <clear/clean>"
	@echo "\tRemove all downloaded files (do not uninstall software)"
	@echo ""
	@echo "make install_database"
	@echo "\tInstall last version of mariadb"
