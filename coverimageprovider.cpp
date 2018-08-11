#include "coverimageprovider.h"
#include "inputhandler.h"

CoverImageProvider::CoverImageProvider() : QQuickImageProvider(QQuickImageProvider::Image)
{

}

QImage CoverImageProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    // This function gets called from qml and provides an image request
    QImage* coverImage = InputHandler::coverQImage; // Request the cover image

    if(coverImage->isNull() || coverImage->width() == 0)
    {
        // If we arrive here, the QImage is empty, so load default image
        QImage defaultImage(":/icons/steam-avatar-profile-picture-0187.jpg");
        return defaultImage;
    }

    // Rescale the image and return
    //coverImage->scaled(requestedSize.width(), requestedSize.height(), Qt::KeepAspectRatio); // resize the image to desired qml size
    return *coverImage;
}
