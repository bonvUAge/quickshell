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

    property string fontFamily: config.barFontFamily
    property string terminal: config.defaultTerminal
    property int textSize: config.barTextSize
    property color barColor: hexToRgba(colors.base, config.barOpacity)
    property color textColor: colors.text
    property color accentColor: colors.accent

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: config.barHeight + config.barMarginTop
    exclusiveZone: implicitHeight

    color: "transparent"

    Rectangle {
        id: barRect
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: config.barMarginSides
        anchors.rightMargin: config.barMarginSides
        anchors.topMargin: config.barMarginTop

        implicitHeight: config.barHeight
        color: bar.barColor
        radius: config.barRadius

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: config.barPaddingSides
            anchors.rightMargin: config.barPaddingSides

            Item {
                Layout.fillWidth: true
            }

            Widgets.Clock {
                Layout.alignment: Qt.AlignVCenter
            }

            Item {
                Layout.fillWidth: true
            }

            Widgets.Button {
                id: bluetoothButton
                Layout.alignment: Qt.AlignVCenter
                icon: ""
                action: [config.defaultTerminal, "--app-id", "smfl", "bluetui"]
            }

            Widgets.SysTray {
                Layout.alignment: Qt.AlignVCenter
                barWindow: bar
            }
        }
    }
}
