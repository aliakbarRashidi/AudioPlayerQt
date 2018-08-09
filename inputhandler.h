#include <QObject>
#include <QMediaPlayer>
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
	void changeQMLProperty(QString objName, const char* prop, QVariant value);



};
