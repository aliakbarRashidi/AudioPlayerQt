#include <QObject>
#include <QMediaPlayer>


class InputHandler: public QObject
{
Q_OBJECT
public:
    InputHandler();
public slots:
    void playButtonClicked();
    void openButtonClicked(QString path);

private:
    QMediaPlayer* player; // Create MediaPlayer



};
