PACKAGE_NAME := peterfajdiga.plasma.thinPager
INSTALL_DIR := ~/.local/share/plasma/plasmoids/${PACKAGE_NAME}

install:
	mkdir -p ${INSTALL_DIR}
	rm -r ${INSTALL_DIR}
	mkdir ${INSTALL_DIR}
	cp -r ./contents ${INSTALL_DIR}
	cp ./metadata.json ${INSTALL_DIR}

run: install
	plasmoidviewer --applet ${PACKAGE_NAME}
