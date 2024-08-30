PACKAGE_NAME := peterfajdiga.plasma.thinPager

.PHONY: install run package

install:
	kpackagetool6 --type=Plasma/Applet --install=./package || kpackagetool6 --type=Plasma/Applet --upgrade=./package

uninstall:
	kpackagetool6 --type=Plasma/Applet --remove=${PACKAGE_NAME}

run: install
	plasmoidviewer --applet ${PACKAGE_NAME}

package:
	cd ./package && zip -r - ./* > ../ThinPager.plasmoid
