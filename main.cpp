#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQuickView>
#include <QQmlContext>
#include <QQmlComponent>
#include <QSlider>
#include <QKeyEvent>
#include "inputhandler.h"
#include "coverimageprovider.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setAttribute(Qt::AA_UseOpenGLES);

    QApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    QQmlEngine engine;
    engine.addImageProvider(QLatin1String("coverart"), new CoverImageProvider); // create image provider for qml

    QQmlComponent component(&engine, "qrc:/main.qml");
    QObject *object = component.create();

    InputHandler inputHandler(object);
    engine.rootContext()->setContextProperty("inputHandler", &inputHandler);

    return app.exec();
}
