import Quickshell
import QtQuick
import QtQuick.Layouts
import "widgets" as Widgets
import "colors/catppuccin.js" as Colors
import "config.js" as Config

PanelWindow {
    id: bar

    function hexToRgba(hex, alpha) {
        var r = parseInt(hex.slice(1, 3), 16) / 255;
        var g = parseInt(hex.slice(3, 5), 16) / 255;
        var b = parseInt(hex.slice(5, 7), 16) / 255;
        return Qt.rgba(r, g, b, alpha);
    }

    property var config: Config.config
    property var colors: Colors

    property string terminal: config.defaultTerminal
    property int textSize: config.barTextSize
    property color barColor: hexToRgba(colors.base, config.barOpacity)
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
