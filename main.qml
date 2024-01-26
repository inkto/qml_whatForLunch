
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

Window{
    id: mainWin
    flags: Qt.Widget | Qt.FramelessWindowHint
    color: "white"
    width: 1000
    height: 600
    visible: true
    property var foodlist: ["稻香情","赛百味","麻辣烫","重庆小面","小碗菜","外卖","别吃了"]
    property real idx: 0
    Button{
        width: 30
        height: width
        anchors.top: parent.top
        anchors.right: parent.right
        onClicked: mainWin.close()
        background: Rectangle{
            color: parent.hovered ? "red":"gray"
        }
        hoverEnabled: true
    }
    Label{
        id: label
        anchors.centerIn: parent
        font.pixelSize: 24
        text: "中午吃什么，吃什么？"

    }
    Label{
        id: foodlabel
//        visible: btn.flip
        anchors.top: label.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: label.horizontalCenter
        font.pixelSize: 20
        Timer{
            interval: 50
            running: btn.flip
            repeat: true
            onTriggered:{
                if(idx < foodlist.length-1){
                    idx++
                }else{
                    idx = 0
                }
                foodlabel.text = foodlist[idx]
            }
        }
    }
    Button{
        id: btn
        anchors.top: foodlabel.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: label.horizontalCenter
        property bool flip: false
        width: 80
        height: 40
        background: Rectangle{
            color: "black"
            radius: 4
            Label{
                id: btnlabel
                anchors.centerIn: parent
                text: btn.flip ? "暂停" : "开始"
                font.pixelSize: 12
                color: "white"
            }
        }
        onClicked: {
            flip = !flip
        }
    }
}
