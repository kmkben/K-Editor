import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs
//import QtQuick.Dialogs 1.2

import kedit.example.editor 1.0

ApplicationWindow {
    id: root
    width: 1024
    height: 780
    visible: true
    title: qsTr("KEDIT")

    menuBar: MenuBar {
        id: menuBar

        Menu {
            id: fileMenu
            title: qsTr("&File")

            MenuBarItem {
                id: newProject
                text: qsTr("&New Project")
                enabled: true
                onTriggered: console.log("New project") //somthing
            }

            MenuBarItem {
                id: newFile
                text: qsTr("New File")
                enabled: true
                icon.source: "qrc:/images/add-document.png"

                onTriggered: {
                    newFileDialog.open();
                }

            }

            MenuBarItem {
                id: openProject
                text: qsTr("Open Project")
                enabled: true
                icon.source: "qrc:/images/open-folder.png"
                onTriggered: console.log("Opening Project ") //somthing
            }

            MenuBarItem {
                id: open
                text: qsTr("Open File")
                enabled: true
                icon.source: "qrc:/images/open-folder.png"
                Shortcut {
                    sequence: StandardKey.Open
                    onActivated: openFileDialog.open()
                }

                onTriggered: {
                    openFileDialog.open()
                }
            }

            MenuBarItem {
                id: save
                text: qsTr("Save")
                enabled: true
                icon.source: "qrc:/images/save.png"
                Shortcut {
                    sequence: StandardKey.Save
                    onActivated: documentController.saveContent();
                }

                onTriggered: {
                    documentController.saveContent();
                }
            }

            MenuBarItem {
                id: saveAs
                text: qsTr("Save As")
                enabled: true
                icon.source: "qrc:/images/saveas.png"
                Shortcut {
                    sequence: StandardKey.SaveAs
                    onActivated: saveFileDialog.open()
                }

                onTriggered: console.log("Saving file as") //somthing
            }

            MenuBarItem {
                id: printDoc
                text: qsTr("Print")
                icon.source: "qrc:/images/printer.png"
                enabled: true
                onTriggered: console.log("Printing doc") //somthing
            }

            MenuBarItem {
                id: exit
                text: qsTr("Exit")
                enabled: true
                icon.source: "qrc:/images/exit.png"
                Shortcut {
                    sequence: StandardKey.Quit
                    onActivated: Qt.quit()
                }

                onTriggered: Qt.quit()
            }
        }

        Menu {
            id: editMenu
            title: qsTr("&Edit")

            MenuBarItem {
                id: undo
                text: qsTr("Undo")
                enabled: true
                icon.source: "qrc:/images/undo.png"
                onTriggered: textEditArea.undo();
            }

            MenuBarItem {
                id: redo
                text: qsTr("Redo")
                enabled: true
                icon.source: "qrc:/images/redo.png"
                onTriggered: textEditArea.redo();
            }

            MenuBarItem {
                id: cut
                text: qsTr("Cut")
                enabled: true
                icon.source: "qrc:/images/cut.png"
                onTriggered: textEditArea.cut();
            }

            MenuBarItem {
                id: copy
                text: qsTr("Copy")
                icon.source: "qrc:/images/copy.png"
                enabled: true

                onTriggered: textEditArea.copy();
            }

            MenuBarItem {
                id: past
                text: qsTr("Past")
                enabled: true
                icon.source: "qrc:/images/paste.png"
                onTriggered: textEditArea.paste();
            }

            MenuBarItem {
                id: selectAll
                text: qsTr("SelectAll")
                enabled: true

                onTriggered: textEditArea.selectAll();
            }
        }

        Menu {
            id: viewMenu
            title: qsTr("&View")

            Action {
                id: statusBar
                text: qsTr(" Status Bar")
                enabled: true
                checkable: true
                onTriggered: console.log("Show Status Bar") //somthing
            }
        }

        Menu {
            id: formatMenu
            title: qsTr("&Format ")

            MenuBarItem {
                id: fontPolice
                text: qsTr("Font")
                enabled: true
                onTriggered: console.log("Change Font") //somthing
            }

            Action {
                id: boldAction
                text: qsTr("Bold")
                enabled: true
                checkable: true

                onTriggered: console.log("Bold") //somthing
            }
        }

        Menu {
            id: helpMenu
            title: qsTr("&Help")

            MenuBarItem {
                id: help
                text: qsTr("Help")
                enabled: true
                onTriggered: console.log("Help") //somthing
            }

            MenuBarItem {
                id: feedback
                text: qsTr("Feedback")
                enabled: true
                onTriggered: console.log("Feedback") //somthing
            }

            MenuBarItem {
                id: about
                text: qsTr("About KEdit")
                enabled: true
                onTriggered: console.log("This an IDE for QML") //somthing
            }
        }
    }

    header: ToolBar {
        id: topToolbard

        Row {
            anchors.fill: parent

            ToolButton {
                id: newFileButon
                icon.source: "qrc:/images/add-document.png"
                onClicked: openFileDialog.open();
            }

            ToolButton {
                id: openButton
                icon.source: "qrc:/images/open-folder.png"
                onClicked: openFileDialog.open();
            }

            ToolButton {
                id: saveButton
                icon.source: "qrc:/images/save.png"
                onClicked: documentController.saveContent();
            }

            ToolButton {
                id: saveAsButton
                icon.source: "qrc:/images/saveas.png"
                onClicked: saveFileDialog.open();
            }

            ToolButton {
                id: undoButton
                icon.source: "qrc:/images/undo.png"
                onClicked: textEditArea.undo();
            }

            ToolButton {
                id: redoButton
                icon.source: "qrc:/images/redo.png"
                onClicked: textEditArea.redo();
            }

            ToolButton {
                id: cutButton
                icon.source: "qrc:/images/cut.png"
                onClicked: textEditArea.cut();
            }

            ToolButton {
                id: copyButton
                icon.source: "qrc:/images/copy.png"
                onClicked: textEditArea.copy();
            }

            ToolButton {
                id: pasteButton
                icon.source: "qrc:/images/paste.png"
                onClicked: textEditArea.paste();
            }

            ToolButton {
                id: printButton
                icon.source: "qrc:/images/printer.png"
                onClicked: saveFileDialog.open();
            }

            ToolButton {
                id: boldButton
                icon.source: "qrc:/images/bold-text.png"
                onClicked: textEditArea.copy();
            }

            ToolButton {
                id: italicButton
                icon.source: "qrc:/images/italic.png"
                onClicked: textEditArea.paste();
            }

            ToolButton {
                id: underlineButton
                icon.source: "qrc:/images/underline.png"
                onClicked: saveFileDialog.open();
            }
        }
    }

    FileDialog {
        id: openFileDialog
        nameFilters: ["text files (*.txt)", "C/C++ (*.c *.cpp *.h *.hpp)", "HTML (*.html *.htm *.html.twig)", "QML (*.qml)", "JS (*.js)", "Java (*.java)", "PHP (*.php)"]
        fileMode: FileDialog.OpenFile
        modality: "WindowModal"
        onAccepted: {
            documentController.openFile(selectedFile);
        }
        onRejected: {
            // skip opening
        }
    }

    FileDialog {
        id: saveFileDialog
        nameFilters: ["text files (*.txt)", "C/C++ (*.c *.cpp *.h *.hpp)", "HTML (*.html *.htm *.html.twig)", "QML (*.qml)", "JS (*.js)", "Java (*.java)", "PHP (*.php)"]
        fileMode: FileDialog.SaveFile
        onAccepted: {
            // Save File
        }
        onRejected: {
            // skip saving
        }
    }

    FileDialog {
        id: newFileDialog
        fileMode: FileDialog.SaveFile
        nameFilters: ["text files (*.txt)", "C/C++ (*.c *.cpp *.h *.hpp)", "HTML (*.html *.htm *.html.twig)", "QML (*.qml)", "JS (*.js)", "Java (*.java)", "PHP (*.php)"]
        title: "Create new file"

        onAccepted: {

        }

        onAcceptLabelChanged: {

        }

        onRejected: {

        }
    }

    FolderDialog {
        id: openFolderDialog
    }


    DocumentController {
        id: documentController
        keditDoc: textEditArea.textDocument

        onFileContentLoaded: function(content, format) {
            textEditArea.textFormat = format;
            textEditArea.text = content;
        }
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent

        TextArea {
            id: textEditArea
            width: parent.width
            //height: parent.height
            anchors.top: topToolbard.bottom
            anchors.bottom: root.bottom
            textFormat: Qt.RichText
            background: Rectangle {
                width: parent.width
                height: parent.height
                color: "white"
            }
            selectByMouse: true
            selectByKeyboard: true
            persistentSelection: true
            clip: true
            wrapMode: Text.WordWrap

            Component.onCompleted: forceActiveFocus()
        }

    }


    footer: ToolBar {
        id: bottomToolBar
    }
}
