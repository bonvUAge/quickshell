import Quickshell
import Quickshell.Io
import QtQuick

Text {
    id: clock
    text: Qt.formatDateTime(clockData.date, "hh:mm")

    color: bar.textColor
    font.pixelSize: bar.textSize
    font.family: bar.fontFamily

    SystemClock {
        id: clockData
        precision: SystemClock.Minutes
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

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
