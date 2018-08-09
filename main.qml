import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Universal 2.0
import QtQuick.Controls.Imagine 2.3
import QtQuick.Controls.Material 2.2
import QtQuick.Dialogs.qml 1.0
import QtQuick.Dialogs 1.2
import Qt.labs.folderlistmodel 2.2

Window {
    id: window
    visible: true
    width: 640
    height: 480
    color: "#252323"
    title: qsTr("Hello World")

    Material.theme: Material.Dark
    Material.accent: Material.Purple

    Image {
        id: image
        x: parent.width/2 - width/2
        y: parent.height * 0.1
        rotation: 0
        source: "icons/steam-avatar-profile-picture-0187.jpg"
    }

    Button {
        background: Image {
            id: play
            anchors.fill: parent
            source: "icons/play-icon-white"
            opacity: playButton.pressed ? 0.7 : 1.0
        }
        onClicked: inputHandler.playButtonClicked()
        id: playButton
        x: parent.width/2 - width/2
        y: parent.height * 0.79
        width: playButton.pressed ? 80 : 84
        height: playButton.pressed ? 80 : 84
        enabled: true
        visible: true
        objectName: "playButton"
    }

    Slider {
        id: positionSlider
        x: parent.width/2 - width/2
        y: parent.height * 0.70
        width: 285
        height: 22
        stepSize: 1
        to: 100
        value: 0
        objectName: "positionSlider"
        onMoved: inputHandler.positionSliderMoved(positionSlider.value)

    }

    Button {
        background: Image {
            id: open
            anchors.fill: parent
            source: "icons/open-file"
            opacity: openButton.pressed ? 0.7 : 1.0
        }
        onClicked:filePicker.visible = true
        id: openButton
        x: parent.width * 0.2
        y: parent.height * 0.83
        width: 30
        height: 30
    }

    FilePicker {
        id: filePicker
        visible: false
        anchors.fill: parent
        showDotAndDotDot: true
        onFileSelected: {
            inputHandler.openButtonClicked(currentFolder() + "/" +fileName)
            filePicker.visible = false
        }
    }

    Button {
        background: Image {
            id: pause
            anchors.fill: parent
            source: "icons/pause-icon-white"
            opacity: pauseButton.pressed ? 0.7 : 1.0
        }
        onClicked: inputHandler.pauseButtonClicked()
        id: pauseButton
        x: parent.width/2 - width/2
        y: parent.height * 0.79
        width: pauseButton.pressed ? 80 : 84
        height: pauseButton.pressed ? 80 : 84
        enabled: false
        visible: false
        objectName: "pauseButton"
    }
}
