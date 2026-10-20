help::
	@echo "help - Print help message."


help::
	@echo "package - Do maven build"
package::
	mvn package

help::
	@echo "clean - Cleans up build."
clean::
	mvn clean

LOGIN_SERVER_TARGET_ZIP:=./login-server/target/login-server.zip
GAME_SERVER_TARGET_ZIP:=./game-server/target/game-server.zip
CHAT_SERVER_TARGET_ZIP:=./chat-server/target/chat-server.zip

LOGIN_SERVER_CUSTOM_CFG:=./login-server/config/myls.properties
GAME_SERVER_CUSTOM_CFG:=./game-server/config/mygs.properties
CHAT_SERVER_CUSTOM_CFG:=./chat-server/config/mycs.properties


AION_SERVERS_DIR:=${HOME}/aion_servers
LOGIN_SERVER_DIR:=$(AION_SERVERS_DIR)/login-server
GAME_SERVER_DIR:=$(AION_SERVERS_DIR)/game-server
CHAT_SERVER_DIR:=$(AION_SERVERS_DIR)/chat-server
help::
	@echo "deploy - Deploys all server files, including custom config files."
deploy::
	@# WARNING: gets rid of old server files!!
	rm -rf "$(LOGIN_SERVER_DIR)"
	rm -rf "$(GAME_SERVER_DIR)"
	rm -rf "$(CHAT_SERVER_DIR)"
	@# unzip all server files
	unzip -q "$(LOGIN_SERVER_TARGET_ZIP)" -d "$(AION_SERVERS_DIR)"
	unzip -q "$(GAME_SERVER_TARGET_ZIP)" -d "$(AION_SERVERS_DIR)"
	unzip -q "$(CHAT_SERVER_TARGET_ZIP)" -d "$(AION_SERVERS_DIR)"
	@# copy all of the configs over
	cp "$(LOGIN_SERVER_CUSTOM_CFG)" "$(LOGIN_SERVER_DIR)/config"
	cp "$(GAME_SERVER_CUSTOM_CFG)" "$(GAME_SERVER_DIR)/config"
	cp "$(CHAT_SERVER_CUSTOM_CFG)" "$(CHAT_SERVER_DIR)/config"

help::
	@echo "first-run - For first time run of the server. Sets up SQL databases."
first-run::

