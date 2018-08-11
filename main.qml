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
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    onClosing: { // the only way it works, since Qt 5.1, and the IDE still thinks its an error, thank you Qt <3
        console.log("wo samma heite?")

        if(filePicker.visible == true)
        {
            close.accepted = false
            filePicker.visible = false
        }
    }

    Image {
        id: coverArt
        x: parent.width/2 - width/2
        y: parent.height - parent.height/1.07
        width: parent.width/1.3
        height: parent.height/2.2
        //source: "icons/steam-avatar-profile-picture-0187.jpg"
        source: "image://coverart/image"
        objectName: "coverArt"
    }

    Button { // playButton
        background: Image {
            id: play
            anchors.fill: parent
            source: "icons/play-icon-white.png"
            opacity: playButton.pressed ? 0.6 : 1.0
        }
        onClicked: inputHandler.playButtonClicked()
        id: playButton
        x: parent.width/2 - width/2
        y: parent.height - parent.height/5
        width: playButton.pressed ? 70 : 74
        height: playButton.pressed ? 70 : 74
        smooth: true
        antialiasing: true
        bottomPadding: 0
        leftPadding: 0
        topPadding: 0
        font.family: "Times New Roman"
        focusPolicy: Qt.StrongFocus
        enabled: true
        visible: true
        objectName: "playButton"
    }

    Button {
        background: Image {
            id: pause
            anchors.fill: parent
            source: "icons/pause-icon-white.png"
            opacity: pauseButton.pressed ? 0.6 : 1.0
        }
        onClicked: inputHandler.pauseButtonClicked()
        id: pauseButton
        x: parent.width/2 - width/2
        y: parent.height - parent.height/5
        width: pauseButton.pressed ? 70 : 74
        height: pauseButton.pressed ? 70 : 74
        antialiasing: true
        autoRepeat: false
        highlighted: false
        wheelEnabled: false
        padding: 0
        enabled: false
        visible: false
        objectName: "pauseButton"
    }

    Slider { // positionSlider
        id: positionSlider
        x: parent.width/2 - width/2
        y: parent.height * 0.70
        width: parent.width/1.5
        height: 25
        antialiasing: true
        stepSize: 0.1
        to: 100
        value: 0
        objectName: "positionSlider"
        onMoved: inputHandler.positionSliderMoved(positionSlider.value)
    }

    Label {
        id: label_timeElapsed
        x: parent.width/10 - width/2
        y: parent.height * 0.707
        color: "#ffffff"
        text: "00:00"
        horizontalAlignment: Text.AlignHCenter
        objectName: "label_timeElapsed"
    }

    Label {
        id: label_timeTotal
        x: parent.width - parent.width/10 - width/2
        y: parent.height * 0.707
        color: "#ffffff"
        text: "00:00"
        horizontalAlignment: Text.AlignHCenter
        objectName: "label_timeTotal"
    }

    Button {
        background: Image {
            id: open
            anchors.fill: parent
            source: "icons/icon-list-100-white"
        }
        onClicked:filePicker.visible = true
        id: openButton
        x: parent.width/4 - width
        y: parent.height - parent.height/6.3
        width: openButton.pressed ? 23 : 25
        height: openButton.pressed ? 23 : 25
        opacity: openButton.pressed ? 0.7 : 1.0
        antialiasing: true
        padding: 0
        leftPadding: 0
        rightPadding: 0
        bottomPadding: 0
        topPadding: 0
    }

    Label {
        id: title_label
        x: parent.width/2 - width/2
        y: parent.height * 0.57
        color: "#ffffff"
        text: ""
        font.bold: true
        font.pointSize: 19
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        objectName: "title_label"
    }

    Label {
        id: artist_label
        x: parent.width/2 - width/2
        y: parent.height * 0.62
        color: "#ffffff"
        text: ""
        font.bold: true
        font.pointSize: 15
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        objectName: "artist_label"
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
