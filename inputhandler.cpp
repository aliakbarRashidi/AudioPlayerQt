#include "inputhandler.h"
#include <QQmlComponent>
#include <QDebug>
#include <QQuickView>
#include <QQuickItem>

InputHandler::InputHandler(QObject* engineObject)
{
    object = engineObject;
    player = new QMediaPlayer;
}

InputHandler::~InputHandler()
{
    delete player;
    delete object;
    player = nullptr;
    object = nullptr;
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

        // Disable playButton and enable pauseButton
        changeQMLProperty("playButton", "visible", "false");
        changeQMLProperty("playButton", "enabled", "false");
        changeQMLProperty("pauseButton", "visible", "true");
        changeQMLProperty("pauseButton", "enabled", "true");

		// Gets the duration of the sond in msec at start
		connect(player, &QMediaPlayer::durationChanged, this, [&](qint64 dur)
        {
			if (dur != 0)
			{
				changeQMLProperty("positionSlider", "to", dur / 1000);
			}
		});

		// Gets the position of the player
		connect(player, &QMediaPlayer::positionChanged, this, [&](qint64 pos)
        {
            changeQMLProperty("positionSlider", "value", pos / 1000);
        });

        // Gets the state of the player
        connect(player, &QMediaPlayer::stateChanged, this, [&](QMediaPlayer::State state)
        {
            if(state == QMediaPlayer::StoppedState) // if song finished
            {
                changeQMLProperty("positionSlider", "value", 0);
                player->setPosition(0);

                changeQMLProperty("playButton", "visible", "true");
                changeQMLProperty("playButton", "enabled", "true");
                changeQMLProperty("pauseButton", "visible", "false");
                changeQMLProperty("pauseButton", "enabled", "false");
            }
        });


    }
    else { // Error
        qDebug() << "The file is not readable.";
    }

}

void InputHandler::pauseButtonClicked()
{
    // Pause button clicked -> pause
    player->pause();

    // Disable pauseButton and enable playButton
    changeQMLProperty("playButton", "visible", "true");
    changeQMLProperty("playButton", "enabled", "true");
    changeQMLProperty("pauseButton", "visible", "false");
    changeQMLProperty("pauseButton", "enabled", "false");
}

void InputHandler::playButtonClicked()
{
    // Play button clicked -> play
    player->play();

    // Disable playButton and enable pauseButton
    changeQMLProperty("playButton", "visible", "false");
    changeQMLProperty("playButton", "enabled", "false");
    changeQMLProperty("pauseButton", "visible", "true");
    changeQMLProperty("pauseButton", "enabled", "true");
}

void InputHandler::positionSliderMoved(quint16 position)
{
    qDebug() << "Slider position: " << position;
    player->setPosition(position * 1000); // Set the player position to position * 1000 -> sec to msec
}

void InputHandler::changeQMLProperty(QString objName, const char* prop, QVariant value)
{
    QObject *obj = object->findChild<QObject*>(objName);
    if (obj)
	{
        obj->setProperty(prop, value);
	}

}
