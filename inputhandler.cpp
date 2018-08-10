#include "inputhandler.h"

InputHandler::InputHandler(QObject* engineObject)
{
    object = engineObject; // create the engine qObject
    player = new QMediaPlayer; // instantiate new QMediaPlayer
}

InputHandler::~InputHandler()
{
    qDebug() << "MASS DESTRUCTION!!!";

    // Clear heap and floating pointer
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

    if(!file.isNull())
    {
        player->setMedia(file); // Load file
        player->setVolume(50); // Set volume
        player->play(); // Play

        // Disable playButton and enable pauseButton
        changeQMLProperty("playButton", "visible", "false");
        changeQMLProperty("playButton", "enabled", "false");
        changeQMLProperty("pauseButton", "visible", "true");
        changeQMLProperty("pauseButton", "enabled", "true");

        // Gets the duration of the sound in msec at start
		connect(player, &QMediaPlayer::durationChanged, this, [&](qint64 dur)
        {
			if (dur != 0)
			{
                changeQMLProperty("positionSlider", "to", dur / 1000); // Set positionSlider max value

                // Set the label_timeTotal label to song duration
                QString durationFormatted = QDateTime::fromTime_t(dur/1000).toUTC().toString("mm:ss");
                changeQMLProperty("label_timeTotal", "text", durationFormatted);
			}
		});

		// Gets the position of the player
		connect(player, &QMediaPlayer::positionChanged, this, [&](qint64 pos)
        {
            changeQMLProperty("positionSlider", "value", pos / 1000); // update positionSlider position

            // Set the label_timeElapsed label to song position
            QString positionFormatted = QDateTime::fromTime_t(pos/1000).toUTC().toString("mm:ss");
            changeQMLProperty("label_timeElapsed", "text", positionFormatted);
        });

        // When the meta data changed
        connect(player, QOverload<>::of(&QMediaObject::metaDataChanged),[=]()
        {
            getMetaData(path);
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
    if(player->isAudioAvailable()) // check if audio is loaded
    {
        // Pause button clicked -> pause
        player->pause();

        // Disable pauseButton and enable playButton
        changeQMLProperty("playButton", "visible", "true");
        changeQMLProperty("playButton", "enabled", "true");
        changeQMLProperty("pauseButton", "visible", "false");
        changeQMLProperty("pauseButton", "enabled", "false");
    }
}

void InputHandler::playButtonClicked()
{
    if(player->isAudioAvailable()) // check if audio is loaded
    {
        // Play button clicked -> play
        player->play();

        // Disable playButton and enable pauseButton
        changeQMLProperty("playButton", "visible", "false");
        changeQMLProperty("playButton", "enabled", "false");
        changeQMLProperty("pauseButton", "visible", "true");
        changeQMLProperty("pauseButton", "enabled", "true");
    }
}

void InputHandler::positionSliderMoved(quint16 position)
{
    qDebug() << "Slider position: " << position;
    player->setPosition(position * 1000); // Set the player position to position * 1000 -> sec to msec
}

void InputHandler::getMetaData(QString path)
{
    // This function tries to get the meta data for the loaded audio
    qDebug() << player->availableMetaData(); // Returns a list of keys there is meta-data available for.
    QString artist = player->metaData(QMediaMetaData::ContributingArtist).toString();
    QString title = player->metaData(QMediaMetaData::Title).toString();
    qDebug() << "Artist: " << artist;
    qDebug() << "Title: " << title;

    changeQMLProperty("title_label", "text", title);
    changeQMLProperty("artist_label", "text", artist);
}

void InputHandler::keyPressEvent(QKeyEvent* event)
{
    qDebug() << event->key();

    if(event->key() == Qt::BackButton)
    {

    }

}

void InputHandler::changeQMLProperty(QString objName, const char* prop, QVariant value)
{
    // Function to change qml properties in the main.qml
    QObject *obj = object->findChild<QObject*>(objName);
    if (obj)
        obj->setProperty(prop, value.toString());
}

