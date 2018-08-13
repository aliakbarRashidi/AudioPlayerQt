#include <QObject>
#include <QQmlComponent>
#include <QDebug>
#include <QQuickView>
#include <QQuickItem>
#include <QDateTime>
#include <QMediaPlayer>
#include <QAudioBuffer>
#include <QAudioOutput>
#include <QMediaMetaData>
#include <qqmlapplicationengine.h>
#include "tag.h"
#include "fileref.h"
#include "mpegfile.h"
#include "id3v2tag.h"
#include "attachedpictureframe.h"

class InputHandler: public QObject
{
Q_OBJECT
public:
    InputHandler(QObject* object);
    ~InputHandler();
    static QImage* coverQImage;
public slots:
    void openButtonClicked(QString path);
    void playButtonClicked();
    void pauseButtonClicked();
    void positionSliderMoved(quint16 position, bool positionSliderIsPressed);

private:
    QMediaPlayer* player; // Create MediaPlayer
    QObject* object;
    bool positionSliderisPressed = false;
    void getMetaData(QString path);
    void changeQMLProperty(QString objName, const char* prop, QVariant value);
    QString makePathValidTagLib(QString path);
    QImage getMPEGCoverImage(TagLib::MPEG::File* file);
};
