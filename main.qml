import QtQuick
import QtQuick.Window
import QtQuick.Dialogs
import QtQml
import QtMultimedia
import QtQuick.Layouts

Window {
    id: root
    color: "white"
    width: 400
    height: 400
    visible: true

    FileDialog {
        id: fileDialog
        title: qsTr("Open file")
        nameFilters: [qsTr("Video File (*.mp4 *.avi *.ogv)")]
        onAccepted: mediaPlayer.source = fileDialog.fileUrl
    }

    Rectangle {
        id: videoRectangle
        height: 200
        color: "black"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0

        MediaPlayer {
            id: mediaPlayer
            source: ""
        }

        VideoOutput {
            id: videoOutput
            anchors.fill: parent
            anchors.topMargin: 0
        }
    }


    SeekControl {
        anchors {
            left: parent.left
            right: parent.right
            margins: 10
            bottom: parent.bottom
        }
        duration: mediaPlayer.duration
        playPosition: mediaPlayer.position
        onSeekPositionChanged: mediaPlayer.seek(seekPosition)
    }

    RowLayout {
        id: rowLayout
        anchors.bottomMargin: 133
        anchors.rightMargin: 0
        spacing: 1
        anchors.fill: parent
        layoutDirection: Qt.LeftToRight
        anchors.leftMargin: 0
        anchors.topMargin: 239
        Layout.fillWidth: true
        Rectangle {
            id: pauseBtn
            width: 100
            height: 30
            color: "red"
            radius: 5

            Text {
                id: pausebtnText
                text: qsTr("Pause")
                color: "white"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                onClicked: {
                    mediaPlayer.pause()
                }
            }
        }

        Rectangle {
            id: playBtn
            width: 100
            height: 30
            color: "green"
            radius: 5

            Text {
                id: playBtnText
                text: qsTr("Play")
                color: "white"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                onClicked: {
                    mediaPlayer.play()
                }
            }
        }

        Rectangle {
            id: chooseBtn
            width: 100
            height: 30
            color: "blue"
            radius: 5

            Text {
                id: chooseBtnText
                text: qsTr("Choose")
                color: "white"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    onClicked: fileDialog.open()
                }
            }
        }

    }
}
