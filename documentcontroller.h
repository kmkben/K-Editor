#ifndef DOCUMENTCONTROLLER_H
#define DOCUMENTCONTROLLER_H

#include <QObject>
#include <QQmlEngine>
#include <QQuickTextDocument>
#include <QTextDocument>
#include <QQmlFile>
#include <QMimeType>
#include <QMimeDatabase>
#include <QFile>

#include <QDebug>

class DocumentController : public QObject
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(QQuickTextDocument *keditDoc READ keditDoc WRITE setKeditDoc NOTIFY keditDocChanged)

    public:
        DocumentController(QObject *parent = nullptr);

        QQuickTextDocument *keditDoc() const;
        void setKeditDoc(QQuickTextDocument*);

        QTextDocument *kTextDocument() const;
        void setKtextDocument(QTextDocument*);

    signals:
        void keditDocChanged();
        void fileContentLoaded(const QString &content, int format);

    public slots:
        void openFile(const QUrl&);
        void saveContent();
        void createFile(const QUrl&);

    private:
        QTextDocument *getKTextDocument();

        QQuickTextDocument *m_keditDoc;
        QTextDocument *m_ktextDocument;
        QUrl m_currentFileUrl;
};

#endif // DOCUMENTCONTROLLER_H
