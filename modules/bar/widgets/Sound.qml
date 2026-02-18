import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.Pipewire

Text {
    id: soundButton

    property string icon: "" || "?"
    property var terminal: bar.config.defaultTerminal || "kitty"
    property var app: ""
    property var size: "bfl"
    property var hyprclass: size
    property var action: [terminal, "--app-id", size, "--class", hyprclass, app]

    property var volume: Math.round(Pipewire.defaultAudioSink.audio.volume * 100)

    text: icon + " " + volume + "%"

    color: mouseArea.containsMouse ? bar.accentColor : bar.textColor
    font.pixelSize: bar.textSize
    font.family: bar.fontFamily

    PwObjectTracker {
        id: audioTracker
        objects: Pipewire.defaultAudioSink
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: {
            if (!buttonProcess.running) {
                buttonProcess.running = true;
            } else {
                buttonProcess.running = false;
            }
        }
    }

    Process {
        id: buttonProcess
        running: false
        command: action
    }
}
