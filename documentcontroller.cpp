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
