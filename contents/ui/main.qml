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
                id: pageItem

                width: thickness
                Layout.fillHeight: true

                color: current ? pageBgColorCurrent :
                    hasWindows ? pageBgColor :
                    pageBgColorEmpty

                readonly property bool current: index === pagerModel.currentPage
                property bool hasWindows: Utils.hasWindows(model)

                Connections {
                    target: model.TasksModel
                    function onRowsInserted() {
                        Utils.updatePageState(model, pageItem);
                    }
                    function onRowsRemoved() {
                        Utils.updatePageState(model, pageItem);
                    }
                }
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
