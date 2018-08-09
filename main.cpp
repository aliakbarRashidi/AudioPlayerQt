#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQuickView>
#include <QQmlContext>
#include <QQmlComponent>
#include <QSlider>
#include "inputhandler.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);

    QQuickStyle::setStyle("Material");

    QQmlEngine engine;
    QQmlComponent component(&engine, "qrc:/main.qml");
	QObject *object = component.create();

    InputHandler inputHandler(object);
    engine.rootContext()->setContextProperty("inputHandler", &inputHandler);

    return app.exec();
}
