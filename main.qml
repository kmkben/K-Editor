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
                onTriggered: console.log("New File") //somthing
            }

            MenuBarItem {
                id: open
                text: qsTr("Open File or Project")
                enabled: true
                onTriggered: {
                    openFileDialog.open()
                }
            }

            MenuBarItem {
                id: openProject
                text: qsTr("Open Project")
                enabled: true
                onTriggered: console.log("Opening Project ") //somthing
            }

            MenuBarItem {
                id: save
                text: qsTr("Save")
                enabled: true
                onTriggered: {
                    saveFileDialog.open();
                }
            }

            MenuBarItem {
                id: saveAs
                text: qsTr("Save As")
                enabled: true
                onTriggered: console.log("Saving file as") //somthing
            }

            MenuBarItem {
                id: printDoc
                text: qsTr("Print")
                enabled: true
                onTriggered: console.log("Printing doc") //somthing
            }

            MenuBarItem {
                id: exit
                text: qsTr("Exit")
                enabled: true
                onTriggered: close();
            }
        }

        Menu {
            id: editMenu
            title: qsTr("&Edit")

            MenuBarItem {
                id: undo
                text: qsTr("Undo")
                enabled: true
                onTriggered: console.log("Undoing") //somthing
            }

            MenuBarItem {
                id: redo
                text: qsTr("Redo")
                enabled: true
                onTriggered: console.log("Redoing") //somthing
            }

            MenuBarItem {
                id: cut
                text: qsTr("Cut")
                enabled: true
                onTriggered: textEditArea.cut();
            }

            MenuBarItem {
                id: copy
                text: qsTr("Copy")
                enabled: true
                onTriggered: textEditArea.copy();
            }

            MenuBarItem {
                id: past
                text: qsTr("Past")
                enabled: true
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

            MenuBarItem {
                id: statusBar
                text: qsTr("Status Bar")
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

            MenuBarItem {
                id: bold
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
    }

    FileDialog {
        id: openFileDialog
        nameFilters: ["text files (*.txt)", "HTML (*.html *.htm)", "C/C++ (*.c *.cpp *.h *.hpp)", "QML (*.qml)", "JS (*.js)", "Java (*.java)"]
        fileMode: FileDialog.OpenFile
        onAccepted: {
            // Load File
        }
        onRejected: {
            // skip opening
        }
    }

    FileDialog {
        id: saveFileDialog
        nameFilters: ["text files (*.txt)", "HTML (*.html *.htm)", "C/C++ (*.c *.cpp *.h *.hpp)", "QML (*.qml)", "JS (*.js)", "Java (*.java)"]
        fileMode: FileDialog.SaveFile
        onAccepted: {
            // Save File
        }
        onRejected: {
            // skip saving
        }
    }

    FolderDialog {
        id: openFolderDialog
    }


    DocumentController {

    }

    TextArea {
        id: textEditArea
        width: parent.width
        height: parent.height
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
        Component.onCompleted: forceActiveFocus()
    }

    footer: ToolBar {
        id: bottomToolBar
    }
}
