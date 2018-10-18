# Load Configuration
CONFIG_FILE := Makefile.config
# Explicitly check for the config file, otherwise make -k will proceed anyway.
ifeq ($(wildcard $(CONFIG_FILE)),)
$(error $(CONFIG_FILE) not found. Copy $(CONFIG_FILE).example)
endif
include $(CONFIG_FILE)


all: install extract patch

install:
	sudo apt-get install wget git

install_database:
	sudo apt-get install mariadb-server

extract:
	git clone $(TPC_URL)

patch:
	./patch-tpcds-kit.sh

build:
	./build.sh

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
