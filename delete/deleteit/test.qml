import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0


ApplicationWindow {
    visible: true
    width: 1300
    height: 800
    title: qsTr("Hello World")
    property int picFlag: 0

    property variant images: ["ui/images/Screenshot_2018-04-12_10-09-05.png"]


    Rectangle {
        id: container
        width: parent.width
        height: parent.height
        color: "grey"


        Image {
            id: img
            height: parent.height / 2
            width: parent.width / 2
            source: "ui/images/Screenshot_2018-04-12_10-09-05.png"

            anchors.centerIn: parent

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    img.source = "ui/images/Screenshot_2018-04-12_10-09-47.png"
                }
            }
        }


    }






}
