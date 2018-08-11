#include <QQuickImageProvider>

class CoverImageProvider : public QQuickImageProvider
{
public:
    CoverImageProvider();
    QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override;
};

