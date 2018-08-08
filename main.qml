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
        source: "steam-avatar-profile-picture-0187.jpg"
    }

    Button {
        background: Image {
            id: play
            anchors.fill: parent
            source: "play-icon-white"
            opacity: playButton.pressed ? 0.7 : 1.0
        }
        onClicked: inputHandler.playButtonClicked()
        id: playButton
        x: parent.width/2 - width/2
        y: parent.height * 0.79
        width: 84
        height: 84
        enabled: true
        visible: true
    }

    Slider {
        id: slider
        x: parent.width/2 - width/2
        y: parent.height * 0.70
        width: 285
        height: 22
        stepSize: 0.1
        to: 10
        value: 0
    }

    Button {
        background: Image {
            id: open
            anchors.fill: parent
            source: "open-file"
            opacity: openButton.pressed ? 0.7 : 1.0
        }
        onClicked:filePicker.visible = true
        id: openButton
        x: parent.width * 0.15
        y: parent.height * 0.815
        width: 45
        height: 45
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
}
