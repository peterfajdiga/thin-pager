PACKAGE_NAME := peterfajdiga.plasma.thinPager
VERSION = $(shell grep '"Version":' ./package/metadata.json | grep -o '[0-9\.]*')

.PHONY: *

install:
	kpackagetool6 --type=Plasma/Applet --install=./package || kpackagetool6 --type=Plasma/Applet --upgrade=./package

uninstall:
	kpackagetool6 --type=Plasma/Applet --remove=${PACKAGE_NAME}

run: install
	plasmoidviewer --applet=${PACKAGE_NAME}

package:
	cd ./package && zip -r - ./* > ../ThinPager_${subst .,_,${VERSION}}.plasmoid
