#include "inputhandler.h"
#include <QQmlComponent>
#include <QDebug>
#include <QFileDialog>
#include <QFileSystemModel>
#include <QTreeView>
#include <QSplitter>

InputHandler::InputHandler()
{
    player = new QMediaPlayer;
}

void InputHandler::playButtonClicked()
{
    qDebug() << "Simma dooo oda wos lous?";
}

void InputHandler::openButtonClicked(QString path)
{
    // This functions gets a file path from the qml and tries to play it
    // Try to laod the file
    QMediaContent file = QUrl(path);

    if (!file.isNull()) // if file
    {
        qDebug() << "Loading: " << path; // print
        player->setMedia(file); // Load file
        player->setVolume(50); // Set volume
        player->play(); // Play

    }
    else { // Error
        qDebug() << "The file is not readable.";
    }


}
