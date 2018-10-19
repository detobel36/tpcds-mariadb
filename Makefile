# Load Configuration
CONFIG_FILE := Makefile.config
# Explicitly check for the config file, otherwise make -k will proceed anyway.
ifeq ($(wildcard $(CONFIG_FILE)),)
$(error $(CONFIG_FILE) not found. Copy $(CONFIG_FILE).example)
else
include $(CONFIG_FILE)
endif

all: install extract patch build

install:
	sudo apt-get install wget git byacc bison gcc flex

extract:
	git clone $(TPC_URL)

patch:
	./patch-tpcds-kit.sh

build:
	./build.sh

remove:
	rm -rf tpcds-kit

clean:
	cd tpcds-kit/tools && $(MAKE) clean

test:
	./datgen.sh $(TEST_SIZE)
	./loadtest.sh $(TEST_SIZE) $(DB_USER) $(MYSQL_PATH)

# DATABASE

install_database:
	sudo apt-get install mariadb-server

create_mysql_user:
	sudo $(MYSQL_PATH) -u root -e "CREATE USER $(DB_USER)@localhost;GRANT ALL PRIVILEGES ON *.* TO $(DB_USER)@localhost;FLUSH PRIVILEGES;"

help:
	@echo "--- Help of this Makefile ---"
	@echo ""
	@echo "----- INIT PROJECT -----"
	@echo "You could make all the following step with the command: *make*"
	@echo ""
	@echo "make install"
	@echo "\tTo install all software"
	@echo ""
	@echo "make extract"
	@echo "\tTo download and unzip TPC-DS files"
	@echo ""
	@echo "make patch"
	@echo "\tApply modifiction to the downloaded TPC-DS files"
	@echo ""
	@echo "make build"
	@echo "\tBuild TPC-DS Tool"
	@echo ""
	@echo "----- CLEAR -----"
	@echo ""
	@echo "make clean"
	@echo "\tClean build of the tool and all other tests"
	@echo ""
	@echo "make remove"
	@echo "\tRemove all downloaded files (do not uninstall software)"
	@echo ""
	@echo "----- TEST -----"
	@echo ""
	@echo "make test"
	@echo "\tGenerate data and test performance (with size specified in the configuration)"
	@echo ""
	@echo "----- DATABASE -----"
	@echo ""
	@echo "make install_database"
	@echo "\tInstall last version of maria-db"
	@echo ""
	@echo "make create_mysql_user"
	@echo "\tCreate user in mariadb (based on configuration) with all permission and without password"
	@echo ""