PACKAGE_NAME := peterfajdiga.plasma.thinPager
INSTALL_DIR := ~/.local/share/plasma/plasmoids/${PACKAGE_NAME}

.PHONY: install run package

install:
	kpackagetool5 -i ./package || kpackagetool5 -u ./package

run: install
	plasmoidviewer --applet ${PACKAGE_NAME}

package:
	cd ./package && zip -r - ./* > ../ThinPager.plasmoid
