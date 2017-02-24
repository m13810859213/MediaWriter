import QtQuick 2.0
import QtQuick.Window 2.0

Item {
    id: fullscreenViewer
    anchors.fill: parent
    visible: false

    MouseArea {
        anchors.fill: parent
        onClicked: fullscreenViewer.hide()
        cursorShape: Qt.PointingHandCursor
    }
    Rectangle {
        anchors.fill: parent
        color: fullscreenViewer.visible ? "black" : "transparent"
        Behavior on color { ColorAnimation { duration: 60 } }
    }

    function show(url) {
        fullscreenViewerImage.source = url
        fullscreenViewer.visible = true
        mainWindow.visibility = Window.FullScreen
    }
    function hide() {
        fullscreenViewerImage.source = ""
        fullscreenViewer.visible = false
        mainWindow.visibility = Window.Windowed
    }
    IndicatedImage {
        id: fullscreenViewerImage
        source: ""
        anchors.centerIn: parent
        property real sourceRatio: sourceSize.width / sourceSize.height
        property real screenRatio: Screen.width / Screen.height
        width: (sourceRatio > screenRatio ? Screen.width : Screen.height * sourceRatio)
        height: (sourceRatio < screenRatio ? Screen.height : Screen.width / sourceRatio)
    }
}
