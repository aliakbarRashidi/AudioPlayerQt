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

class InputHandler: public QObject
{
Q_OBJECT
public:
    InputHandler(QObject* object);
    ~InputHandler();
public slots:
    void openButtonClicked(QString path);
    void playButtonClicked();
    void pauseButtonClicked();
    void positionSliderMoved(quint16 position);

private:
    QMediaPlayer* player; // Create MediaPlayer
    QObject* object;
    bool positionSliderIsPressed = false;
    void getMetaData(QString path);
	void changeQMLProperty(QString objName, const char* prop, QVariant value);
    void keyPressEvent(QKeyEvent* event);
};
