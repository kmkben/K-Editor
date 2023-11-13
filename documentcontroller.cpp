#include "documentcontroller.h"

DocumentController::DocumentController(QObject *parent) : QObject(parent)
{

}
QQuickTextDocument *DocumentController::keditDoc() const
{
    return m_keditDoc;
}


void DocumentController::setKeditDoc(QQuickTextDocument *doc)
{
    m_keditDoc = doc;
    emit keditDocChanged();
}

QTextDocument *DocumentController::kTextDocument() const
{
    return m_ktextDocument;
}

void DocumentController::setKtextDocument(QTextDocument* textDocument)
{
    m_ktextDocument = textDocument;
}

QTextDocument *DocumentController::getKTextDocument()
{
    if (m_keditDoc == nullptr)
    {
        m_ktextDocument = nullptr;
    }
    else
    {
        m_ktextDocument = m_keditDoc->textDocument();
    }

    return m_ktextDocument;
}




/*
 *
 * Slots
 *
 */

void DocumentController::openFile(const QUrl &fileUrl)
{
    if (fileUrl.isEmpty())
    {
        return;
    }

    const QString filename = QQmlFile::urlToLocalFileOrQrc(QUrl(fileUrl));

    if (QFile::exists(filename))
    {
        //QMimeType mimeType = QMimeDatabase().mimeTypeForFile(filename);

        QFile fileObj(filename);

        if (fileObj.open(QFile::ReadOnly))
        {
            QByteArray content = fileObj.readAll();
//            QString content= "";
//            while (!fileObj.atEnd())
//            {
//                content.append(fileObj.readLine());
//                content.append("\n");
//            }
            m_ktextDocument = m_keditDoc->textDocument();

            if (m_ktextDocument)
            {
                emit fileContentLoaded(QString::fromUtf8(content), Qt::MarkdownText);
                //emit fileContentLoaded(content, Qt::MarkdownText);
                m_ktextDocument->setModified(false);
            }

            // qInfo() << content;
        }
    }

    m_currentFileUrl = fileUrl;
}


void DocumentController::createFile(const QUrl& fileUrl)
{
    if (fileUrl.isEmpty())
    {
        return;
    }

    const QString filename = QQmlFile::urlToLocalFileOrQrc(QUrl(fileUrl));

    QFile fileObj(filename);

    fileObj.open(QFile::WriteOnly);
    fileObj.write("");
    fileObj.close();

    if (fileObj.open(QFile::ReadOnly))
    {
        QByteArray content = fileObj.readAll();
        //            QString content= "";
        //            while (!fileObj.atEnd())
        //            {
        //                content.append(fileObj.readLine());
        //                content.append("\n");
        //            }
        m_ktextDocument = m_keditDoc->textDocument();

        if (m_ktextDocument)
        {
            emit fileContentLoaded(QString::fromUtf8(content), Qt::MarkdownText);
            //emit fileContentLoaded(content, Qt::MarkdownText);
            m_ktextDocument->setModified(false);
        }

        // qInfo() << content;
    }

    m_currentFileUrl = fileUrl;
}


void DocumentController::saveContent()
{
    if (m_currentFileUrl.isEmpty() || m_keditDoc == nullptr)
    {
        return;
    }

    m_ktextDocument = m_keditDoc->textDocument();

    const QString currentFilePath = m_currentFileUrl.toLocalFile();

    QFile fileObj(currentFilePath);

    if (fileObj.open(QFile::WriteOnly))
    {
        fileObj.write(m_ktextDocument->toPlainText().toUtf8());
        fileObj.close();
    }
}



