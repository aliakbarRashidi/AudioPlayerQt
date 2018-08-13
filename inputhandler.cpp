#include "inputhandler.h"

QImage* InputHandler::coverQImage = new QImage;

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
            // Checks the global bool if the positionSlider is being pressed, if not update else do nothing
            if(positionSliderisPressed == false)
            {
                changeQMLProperty("positionSlider", "value", pos / 1000); // update positionSlider position

                // Set the label_timeElapsed label to song position
                QString positionFormatted = QDateTime::fromTime_t(pos/1000).toUTC().toString("mm:ss");
                changeQMLProperty("label_timeElapsed", "text", positionFormatted);
            }
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
    // This functions is called when the pauseButton is clicked
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
    // This functions is called when the playButton is clicked
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

void InputHandler::positionSliderMoved(quint16 position, bool pressed)
{
    // This functions is called when the positionSlider is moved
    // quint16 position in sec
    // sets global bool if positionSlider is pressed, so when pressed it wont be updated by the slots
    positionSliderisPressed = pressed;
    if(pressed == false)
        player->setPosition(position * 1000); // Set the player position to position * 1000 -> sec to msec

    QString positionFormatted = QDateTime::fromTime_t(position).toUTC().toString("mm:ss");
    changeQMLProperty("label_timeElapsed", "text", positionFormatted);

    qDebug() << "Position slider pressed: " << pressed;
    qDebug() << "label_timeElapsed: " << positionFormatted;
}

void InputHandler::getMetaData(QString path)
{
    // This functions gets the metadata from the .mp3
    qDebug() << path;
    QString validPath = makePathValidTagLib(path);

    // Create the TagLib File
    TagLib::MPEG::File f(validPath.toUtf8().constData());

    if(f.isValid()) // if valid
    {
        QString artist = f.tag()->artist().toCString();
        QString title = f.tag()->title().toCString();
        QImage coverImage = getMPEGCoverImage(&f);

        changeQMLProperty("coverArt", "source", QString("image://coverart/" + QString::number(coverImage.width())));
        qDebug() << "generatedImageId:  " << QString("image://coverart/" + QString::number(coverImage.width()));

        qDebug() << "Artist: " << artist;
        qDebug() << "Title: " << title;

        changeQMLProperty("title_label", "text", title);
        changeQMLProperty("artist_label", "text", artist);

    } else {
        qDebug() << "Not metadata available.";
    }
}

void InputHandler::changeQMLProperty(QString objName, const char* prop, QVariant value)
{
    // This function changes qml properties in the main.qml
    QObject *obj = object->findChild<QObject*>(objName);
    if (obj)
        obj->setProperty(prop, value.toString());
}

QString InputHandler::makePathValidTagLib(QString path)
{
    // This function removes the file:// from the path because
    // else TagLib can't find the file
    return path.replace("file://", "");
}

QImage InputHandler::getMPEGCoverImage(TagLib::MPEG::File* file)
{
    // This function gets the MPEG cover art, if any
    TagLib::ID3v2::Tag* tag = file->ID3v2Tag(true);
    TagLib::ID3v2::FrameList frameList = tag->frameList("APIC");

    if(frameList.isEmpty())
    {
        qDebug() << "No cover image for this song";
        return QImage();
    }

    TagLib::ID3v2::AttachedPictureFrame* coverImage = static_cast<TagLib::ID3v2::AttachedPictureFrame*>(frameList.front());

    coverQImage->loadFromData(reinterpret_cast<const uchar*>(coverImage->picture().data()) , static_cast<int>(coverImage->picture().size()));

    return *coverQImage;
}

