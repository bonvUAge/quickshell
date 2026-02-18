import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick

Item {
    id: root
    implicitWidth: trayRow.implicitWidth
    implicitHeight: 30

    required property var barWindow

    Row {
        id: trayRow
        spacing: 5
        // anchors.verticalCenter: parent.verticalCenter

        Repeater {
            model: SystemTray.items

            Rectangle {
                id: trayItem
                width: 24
                height: 24
                color: "transparent"

                required property var modelData
                property bool menuOpen: false

                IconImage {
                    anchors.centerIn: parent
                    implicitSize: 18
                    source: trayItem.modelData.icon
                }

                QsMenuAnchor {
                    id: menuAnchor
                    menu: trayItem.modelData.menu
                    anchor.window: root.barWindow
                    anchor.item: trayItem
                    anchor.edges: Edges.Bottom

                    onClosed: trayItem.menuOpen = false
                }

                Connections {
                    target: trayItem
                    function onMenuOpenChanged() {
                        if (trayItem.menuOpen) {
                            menuAnchor.open();
                        } else {
                            menuAnchor.close();
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton

                    onClicked: function (mouse) {
                        if (mouse.button === Qt.LeftButton) {
                            trayItem.modelData.activate();
                        } else if (mouse.button === Qt.RightButton) {
                            if (trayItem.modelData.hasMenu) {
                                trayItem.menuOpen = !trayItem.menuOpen;
                            }
                        }
                    }
                }
            }
        }
    }
}
