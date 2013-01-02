/*
 *   Copyright 2012 Alex Merry <alex.merry@kdemail.net>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents

Item {
    id: root

    property Mpris2 source

    implicitHeight: childrenRect.height
    implicitWidth: childrenRect.width
    height: childrenRect.height
    width: childrenRect.width

    Rectangle {
        id: mainRectangle
        color: "transparent"
        width: parent.width
        height: parent.height
        Rectangle {
            id: lyricsScreen
            color: "transparent"
            width: mainRectangle.width
            height: mainRectangle.height

            Flickable {
                id: flickArea
                anchors.fill: parent
                contentWidth: lyricsText.width
                contentHeight: lyricsText.height
                flickableDirection: Flickable.VerticalFlick
                clip: true

                Text {
                    id: lyricsText
                    color: theme.textColor
                    wrapMode: Text.Wrap
                    width: lyricsScreen.width
                    visible: text != ''
                    text: source.asText
                }
            }
        }
    }
}

// vi:sts=4:sw=4:et
