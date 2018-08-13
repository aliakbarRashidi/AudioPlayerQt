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
        source: "image://coverart/image"
        objectName: "coverArt"
    }

    Button { // playButton
        background: Image {
            id: play
            anchors.fill: parent
            source: "icons/modern-play-white.png"
        }
        onClicked: inputHandler.playButtonClicked()
        id: playButton
        x: parent.width /2 - width/2
        y: openButton.y - height/2.7
        width: playButton.pressed ? 78 : 81
        height: playButton.pressed ? 78 : 81
        transformOrigin: Item.Center
        opacity: playButton.pressed ? 0.6 : 1.0
        enabled: true
        visible: true
        objectName: "playButton"
    }

    Button {
        background: Image {
            id: pause
            anchors.fill: parent
            source: "icons/modern-pause-white.png"
        }
        onClicked: inputHandler.pauseButtonClicked()
        id: pauseButton
        x: parent.width/2 - width/2
        y: openButton.y - height/2.7
        width: pauseButton.pressed ? 78 : 81
        height: pauseButton.pressed ? 78 : 81
        transformOrigin: Item.Center
        opacity: pauseButton.pressed ? 0.6 : 1.0
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
        objectName: "positionSlider"
        onPressedChanged: {
            inputHandler.positionSliderMoved(positionSlider.value, positionSlider.pressed)
        }
        onMoved: {
            inputHandler.positionSliderMoved(positionSlider.value, positionSlider.pressed)
        }
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
            antialiasing: true
            transformOrigin: Item.Center
            anchors.fill: parent
            source: "icons/icon-list-100-white"
        }
        onClicked:filePicker.visible = true
        id: openButton
        x: playButton.x/2 - width/2
        y: parent.height/1.185
        width: 23
        height: 23
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

/*##^## Designer {
    D{i:2;anchors_height:74;anchors_width:74;anchors_x:283;anchors_y:384}D{i:9;anchors_height:25;anchors_width:25;anchors_x:135;anchors_y:402.5}
}
 ##^##*/
