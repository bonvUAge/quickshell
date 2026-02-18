import Quickshell
import QtQuick
import QtQuick.Layouts
import "widgets" as Widgets
import "colors/catppuccin.js" as Colors

PanelWindow {
    id: bar

    property string terminal: "kitty"
    property int textSize: 16
    property color barColor: Colors.base
    property color textColor: Colors.text

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30
    exclusiveZone: implicitHeight

    color: barColor

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        Item {
            Layout.fillWidth: true
        }

        Widgets.Clock {
            Layout.alignment: Qt.AlignVCenter
        }

        Item {
            Layout.fillWidth: true
        }

        Widgets.SysTray {
            Layout.alignment: Qt.AlignVCenter
            barWindow: bar
        }
    }
}
