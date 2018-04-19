import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0

Pane {
    id:appDetail

    anchors.centerIn: parent

    width: parent.width - 10
    height: parent.height - 10
   // Material.elevation: 2
    property string applicationName: selectedApplication
    property variant urls: screenshotUrls
    property int length: urls.length
    property int ind: 0
    property int i: indicator.index
    property int pagenum: swipeView.currentIndex
    property string appDetailText: "fskhskhkhslskvlkvslkvlslvdsbv"

    ListModel {
        id: lm
        ListElement {
            url : ""
        }
    }

    Pane{
        id:appName
        width: parent.width -50
        height: parent.height / 5
        x: 15
        y: 15
//        anchors.topMargin: 15
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.top: parent.top
        Material.elevation: 3

        Behavior on height{
            NumberAnimation {
                easing.type: Easing.OutExpo
                duration: 200

            }
        }


        Image{
            id:im
            width:110
            height: 110
            anchors.left: parent.left
            verticalAlignment: Image.AlignVCenter
            visible: true
            source: "image://application/" + getCorrectName(applicationName)

        }
        Text {
            anchors.centerIn: parent
            font.pointSize:24
            text: "<b>" + getCorrectName(applicationName) +"</b>"
            horizontalAlignment: Text.AlignHCenter

        }



    }
    Pane{
        id:textPane
        Material.elevation : 3
        width: parent.width / 2.75
        height: width - 15

        x: imagesPane.width+40
        y: parent.height - (imagesPane.height + 15)

        Text {
            id:txt
            visible:true
            font.family: "Carlito"
            width: parent.width
            height: parent.height

            horizontalAlignment: Text.AlignLeft
            font.pointSize: 12
            topPadding: 15
            bottomPadding: 15
            leftPadding: 15
            rightPadding: 15
            textFormat: Text.RichText
            text: appDetailText

        }



    }


    Pane {
        id: imagesPane
        Material.elevation : 3
        width: parent.width * 7 / 12
        height: (width * 9 / 16) + indicator.height + 15

        x: 0
        y: parent.height - (imagesPane.height + 15)

        Label {
            id: indicator
            property int index: 0
            visible: urls[0] !== "none"
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                //topMargin: 5
            }

            text: (index == -1 ? lm.count.toString() : index + 1) + "/" + lm.count
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.capitalization: Font.Capitalize
            enabled: false


        }

        ListView {
            id: screenshotsLV
            interactive: true
            spacing: 15
            clip: true
            orientation: Qt.Horizontal
            width: parent.width
            height: width * 9 / 16
            anchors.centerIn: parent
            model: lm
            snapMode: ListView.SnapOneItem
            delegate: Item {
                width: screenshotsLV.width - 10
                height: screenshotsLV.height - 10
                Image {
                    id:ss
                    visible: url != "none"
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: url == "none" ? "" : url
                    MouseArea{
                        id:ssma
                        anchors.fill:parent

                        onClicked: {
                            popupImage.source = ss.source
                            popup.open()
                        }

                    }
                }
                onChildrenChanged: i = indicator
                Popup {
                    id:popup
                    width: appDetail.width - 100
                    height: appDetail.height - 50
                    parent: appDetail
                    modal: true
                    focus: true

                    closePolicy: Popup.CloseOnPressOutside
                    onClosed: {
                        i = indicator.index
                    }
                    onOpened: {
                        i = indicator.index
                    }
                    Image{
                        id:popupImage
                        fillMode: Image.PreserveAspectFit
                        anchors.centerIn: parent
                        source: ss.source



                    }
                    Rectangle{
                        id:nextRect
                        width:75
                        height: parent.height * 5 / 6
                        color: "transparent"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        opacity: nextMa.containsMouse ? 1.0 : 0

                        Behavior on opacity {
                            NumberAnimation {
                                duration: 500
                            }
                        }

                        MouseArea {
                            id:nextMa
                            anchors.fill: parent

                            hoverEnabled: true
                            onClicked:{
                                i=i + 1
                                if (i==length) {
                                    i = 0
                                }
                                popupImage.source = urls[i]


                            }
                            onClipChanged: i = indicator.index


                        }

                        Image{
                            id:nextIm
                            width: 64
                            height: 64
                            anchors.right: parent.right
                            anchors.centerIn: parent
                            source:"/images/search.svg"

                        }
                    }
                    Rectangle{
                        id:prevRect
                        width:75
                        height: parent.height * 5 / 6
                        color: "transparent"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        opacity: prevMa.containsMouse ? 1.0 : 0

                        Behavior on opacity {
                            NumberAnimation {
                                duration: 500
                            }
                        }

                        MouseArea {
                            id:prevMa
                            anchors.fill: parent

                            hoverEnabled: true
                            onClicked:{
                                i= i - 1
                                if (i==-1) {

                                    i = length - 1

                                }
                                popupImage.source = urls[i]


                            }



                        }

                        Image{
                            id:prev
                            width: 64
                            height: 64
                            anchors.right: parent.right
                            anchors.centerIn: parent
                            source:"/images/search.svg"

                        }
                    }





                }




                DropShadow {
                    id:dropShadow
                    visible: ss.visible
                    anchors.fill: ss
                    horizontalOffset: 3
                    verticalOffset: 3
                    radius: 8
                    samples: 17
                    color: "#80000000"
                    source: ss
                }

                Label {
                    anchors.centerIn: parent
                    text: qsTr("no screenshot found!")
                    visible: url == "none"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.capitalization: Font.Capitalize
                    enabled: false
                }

                BusyIndicator {
                    id: imageBusy
                    anchors.centerIn: parent
                    running: url == "none" ? 0 : !ss.progress
                }
            }

            onMovementEnded: {
                indicator.index = indexAt(contentX,contentY)

            }
        }
    }

    ParallelAnimation {
        id: detailAnimation

        NumberAnimation {
            target: imagesPane
            property: "x"
            easing.type: Easing.OutBounce
            duration: 2000
            from:- imagesPane.width
            to : 15
        }

        NumberAnimation {
            target: imagesPane
            property: "opacity"
            duration: 2000
            from: 0
            to : 1
        }
        NumberAnimation {
            target: textPane
            property: "x"
            easing.type: Easing.OutBounce
            duration: 2000
            from: appDetail.width
            to : imagesPane.width+40
        }

        NumberAnimation {
            target: textPane
            property: "opacity"
            duration: 2000
            from: 0
            to : 1
        }
        NumberAnimation {
            target: appName
            property: "y"
            easing.type: Easing.OutBounce
            duration: 2000
            from: - appName.height
            to : 15
        }

        NumberAnimation {
            target: appName
            property: "opacity"
            duration: 2000
            from: 0
            to : 1
        }



        onStarted: {
            imagesPane.x =  - imagesPane.width
            imagesPane.opacity = 0
            textPane.x = appDetail.width
            textPane.opacity = 0
            appName.opacity = 0
            appName.y = -appName.height
        }



    }



    onPagenumChanged: {
        if (pagenum==2){
            detailAnimation.start()

        }

    }


    onLengthChanged: {
        lm.clear()
        for(var i=0; i < length; i++) {
            lm.append({"url" : urls[i]})
        }
    }


}

