TPC_URL=https://owncloud.ulb.ac.be/index.php/s/v6BsCennyblD6OQ/download

install:
	sudo apt-get install wget

extract:
	git clone https://github.com/gregrahn/tpcds-kit.git
#	wget $(TPC_URL) -O tpc_zip.zip
#	./extract_src.sh tpc_zip.zip
#	rm -rf tpc_zip.zip

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
