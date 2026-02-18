import Quickshell
import QtQuick
import QtQuick.Layouts
import "widgets" as Widgets
import "colors/catppuccin.js" as Colors
import "config.js" as Config

PanelWindow {
    id: bar

    property var config: Config.config
    property var colors: Colors

    property string terminal: config.defaultTerminal
    property int textSize: config.barTextSize
    property color barColor: colors.base
    property color textColor: colors.text

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: config.barHeight
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
