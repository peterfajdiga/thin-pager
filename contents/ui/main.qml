import QtQuick 2.15
import QtQuick.Layouts 1.15
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.private.pager 2.0
import "./utils.js" as Utils

Item {
    id: root

    anchors.fill: parent
    Layout.minimumWidth: thickness
    Layout.preferredWidth: thickness

    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
    Plasmoid.constraintHints: PlasmaCore.Types.CanFillArea

    readonly property int thickness: 4
    readonly property color pageBgColor: Utils.colorAlpha(PlasmaCore.ColorScope.textColor, 0.2)
    readonly property color pageBgColorEmpty: "transparent"
    readonly property color pageBgColorCurrent: PlasmaCore.ColorScope.highlightColor

    ColumnLayout {
        id: pagesContainer

        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: thickness
        spacing: 1

        Repeater {
            model: pagerModel

            Rectangle {
                width: thickness
                Layout.fillHeight: true

                color: index === pagerModel.currentPage ? pageBgColorCurrent :
                    Utils.hasWindows(model) ? pageBgColor :
                    pageBgColorEmpty
            }
        }
    }

    PagerModel {
        id: pagerModel

        enabled: root.visible

        showDesktop: false

        showOnlyCurrentScreen: false
        screenGeometry: Plasmoid.screenGeometry

        pagerType: PagerModel.VirtualDesktops
    }
}
