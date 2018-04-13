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

    Item{
        id:main
        anchors.fill:parent

        Rectangle{
            id:realInvisibleRect
            visible: true
            color: "transparent"
            width: 1300
            height: 800
            MouseArea{
                anchors.fill: parent
                onClicked: picFlag=0
            }
        }


        Pane {
            id:parentPane
            width: parent.width * 2 / 3
            height: parent.height / 4
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            Material.elevation: 8
            Material.background: Material.Red
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
                source: "ui/images/if_whatsapp_395429.svg"


            }
            Text {
                anchors.centerIn: parent
                font.pointSize:24
                text: "<b>Whatsapp application</b>"
                horizontalAlignment: Text.AlignHCenter

            }


        }

        Pane{
            id: imagesPane
            width: parent.width / 2.1
            height: parent.height * 3 / 5
            anchors.bottom:parent.bottom
            anchors.left:parent.left
            anchors.bottomMargin: 15
            anchors.leftMargin: 15
            Material.elevation : 8
            Material.background: Material.Grey


            Behavior on width {
                NumberAnimation {
                    easing.type: Easing.OutExpo
                    duration: 200
                }
            }

            Behavior on height {
                NumberAnimation {
                    easing.type: Easing.OutExpo
                    duration: 200
                }
            }

            Behavior on x {
                NumberAnimation {
                    easing.type: Easing.OutExpo
                    duration: 200
                }
            }

            Behavior on y {
                NumberAnimation {
                    easing.type: Easing.OutExpo
                    duration: 200
                }
            }
            Rectangle{
                id:rect1
                width: parent.width/3.2
                height: parent.height/3.2
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.left:parent.left
                Image{
                    id:im1
                    width: parent.width
                    height: parent.height
                    source: "/ui/images/Screenshot_2018-04-12_10-09-05.png"

                }
                MouseArea{
                    id:ma1
                    anchors.fill:parent
                    onClicked: picFlag=1



                }

            }
            Rectangle{
                id:rect2
                width: parent.width/3.2
                height: parent.height/3.2
                anchors.left: rect1.right
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 8

                anchors.rightMargin: 8
                Image{
                    id:im2
                    source: "/ui/images/Screenshot_2018-04-12_10-09-25.png"
                    width: parent.width
                    height: parent.height

                }
                MouseArea{
                    id:ma2
                    anchors.fill:parent
                    onClicked: picFlag=2



                }

            }
            Rectangle{
                id:rect3
                width: parent.width/3.2
                height: parent.height/3.2
                anchors.left:rect2.right
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                Image{
                    id:im3
                    width: parent.width
                    height: parent.height
                    source: "/ui/images/Screenshot_2018-04-12_10-09-47.png"

                }
                MouseArea{
                    id:ma3
                    anchors.fill:parent
                    onClicked: picFlag=3



                }

            }
            Rectangle{
                id:rect4
                width: parent.width/3.2
                height: parent.height/3.2
                anchors.top: rect1.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                Image{
                    id:im4
                    width: parent.width
                    height: parent.height
                    source: "/ui/images/Screenshot_2018-04-12_10-09-47.png"

                }
                MouseArea{
                    id:ma4
                    anchors.fill:parent
                    onClicked: picFlag=4



                }

            }



        }
        Pane{
            id: textPane
            width: parent.width / 2.1
            height: parent.height * 3 / 5
            anchors.bottom:parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 15
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            Material.elevation: 8
            Material.background: Material.Lime
            Behavior on width {
                NumberAnimation {
                    easing.type: Easing.OutExpo
                    duration: 200
                }
            }

            Behavior on height {
                NumberAnimation {
                    easing.type: Easing.OutExpo
                    duration: 200
                }
            }

            Behavior on x {
                NumberAnimation {
                    easing.type: Easing.OutExpo
                    duration: 200
                }
            }

            Behavior on y {
                NumberAnimation {
                    easing.type: Easing.OutExpo
                    duration: 200
                }
            }
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
                text:"WhatsApp Messenger is a FREE messaging app available for Android and other smartphones. WhatsApp uses your phone's Internet connection (4G/3G/2G/EDGE or Wi-Fi, as available) to let you message and call friends and family. Switch from SMS to WhatsApp to send and receive messages, calls, photos, videos, documents, and Voice Messages. WHY USE WHATSAPP:  • NO FEES: WhatsApp uses your phone's Internet connection (4G/3G/2G/EDGE or Wi-Fi, as available) to let you message and call friends and family, so you don't have to pay for every message or call.* There are no subscription fees to use WhatsApp.  • MULTIMEDIA: Send and receive photos, videos, documents, and Voice Messages." +  "• FREE CALLS: Call your friends and family for free with WhatsApp Calling, even if they're in another country.* WhatsApp calls use your phone's Internet connection rather than your cellular plan's voice minutes. (Note: Data charges may apply. Contact your provider for details. Also, you can't access 911 and other emergency service numbers through WhatsApp). \n • GROUP CHAT: Enjoy group chats with your contacts so you can easily stay in touch with your friends or family. \n • WHATSAPP WEB: You can also send and receive WhatsApp messages right from your computer's browser. \n • NO INTERNATIONAL CHARGES: There's no extra charge to send WhatsApp messages internationally. Chat with your friends around the world and avoid international SMS charges.*
"
                wrapMode: Text.Wrap


            }



        }




    }


    Pane{
        id:invisiblePane
        visible: picFlag > 0 ? true : false
        opacity: picFlag > 0 ? 1 : 0
        anchors.centerIn: parent

        //visible: true
        width: parent.width-100
        height: parent.height-100
        Material.elevation:10
        Material.background: Material.BlueGrey

        Behavior on opacity  {
            NumberAnimation {
                duration: 500
            }

        }

        Image{
            id:imageShown
            anchors.centerIn: parent
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
                onClicked: goNext(picFlag)
            }
            Image{
                id:prev
                width: 64
                height: 64
                anchors.right: parent.right
                anchors.centerIn: parent
                source:"/ui/images/nxt.svg"

            }
        }
        Rectangle{
            id:prevRect
            width:75
            height: parent.height * 5 / 6
            color: "transparent"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left:parent.left
            opacity: prevMa.containsMouse ? 1.0 : 0

            Behavior on opacity {
                NumberAnimation {
                    duration: 500
                }
            }

            MouseArea {
                id:prevMa
                anchors.fill:parent
                hoverEnabled: true
                onClicked: goPrev(picFlag)

            }
            Image{
                id:next
                width: 64
                height: 64
                anchors.centerIn: parent
                source:"/ui/images/prev.svg"
            }
        }
        Rectangle{
            color: "transparent"
            anchors.top:parent.top
            anchors.right:parent.right
            width: 64
            height: 64
            Image{
                anchors.fill:parent
                source: "/ui/images/if_Cancel_1493282.svg"
            }
            MouseArea{
                id:exitArea
                anchors.fill: parent
                onClicked: picFlag = 0
            }

        }

    }



    function showPic(f) {
        if (f===1){
            imageShown.source = im1.source
        }
        else if (f===2){
            imageShown.source = im2.source
        }
        else if (f===3){
            imageShown.source = im3.source
        }
        if (f===4){
            imageShown.source = im4.source
        }


    }
    function goNext(f){
        if (f===4){
            picFlag=1
        }
        else {
            picFlag=picFlag+1
        }


    }

    function goPrev(f){
        if (f===1){
            picFlag=4
        }
        else{
            picFlag=picFlag-1
        }
    }


    onPicFlagChanged: {
        showPic(picFlag)
    }


}


