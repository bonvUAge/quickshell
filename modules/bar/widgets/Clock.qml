import Quickshell
import Quickshell.Io
import QtQuick

Text {
    id: clock
    text: Qt.formatDateTime(clockData.date, "hh:mm")

    color: mouseArea.containsMouse ? bar.accentColor : bar.textColor
    font.pixelSize: bar.textSize
    font.family: bar.fontFamily

    SystemClock {
        id: clockData
        precision: SystemClock.Minutes
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true

        onClicked: {
            if (!calendarProcess.running) {
                calendarProcess.running = true;
            } else {
                calendarProcess.running = false;
            }
        }
    }

    Process {
        id: calendarProcess
        running: false
        command: [bar.terminal, "--app-id", "smfl", "lvsk-calendar"]
    }
}
