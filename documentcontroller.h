#ifndef DOCUMENTCONTROLLER_H
#define DOCUMENTCONTROLLER_H

#include <QObject>
#include <QQmlEngine>
#include <QQuickTextDocument>
#include <QTextDocument>

class DocumentController : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QQuickTextDocument *keditDoc READ keditDoc WRITE setKeditDoc NOTIFY keditDocChanged)

    public:
        DocumentController(QObject *parent = nullptr);

        QQuickTextDocument *keditDoc() const;
        void setKeditDoc(QQuickTextDocument*);

    signals:
        void keditDocChanged();

    private:
        QQuickTextDocument *m_keditDoc;
};

#endif // DOCUMENTCONTROLLER_H
