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

    property int minimumWidth: metadataPane.implicitHeight + 100
    property int minimumHeight: metadataPane.implicitHeight + progressBar.height + metadataPane.anchors.bottomMargin

    Mpris2 {
        id: source
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent

        AlbumArt {
            id: albumArt
            artUrl: source.artUrl
            anchors {
                top: parent.top
                left: parent.left
            }
            height: 96
            width: 96
        }

        MetadataPanel {
            id: metadataPane
            anchors {
                top: parent.top
                left: albumArt.right
                leftMargin: 5
                right: parent.right
                bottom: albumArt.bottom
                bottomMargin: 5
            }
            source: source
        }

        Controls {
            id: controls
            visible: source.canControl && mouseArea.containsMouse
            anchors {
                bottom: metadataPane.bottom
                left: metadataPane.left
                leftMargin: metadataPane.contentLeftOffset
                right: parent.right
            }
            source: source
        }
        
        PositionSlider {
            id: progressBar
            anchors {
                top: albumArt.bottom
                topMargin: 5
                left: parent.left
                right: parent.right
            }
            height: 10
            source: source
        }

        LyricsPanel {
            id: lyricsPanel
            anchors {
                top: progressBar.bottom
                topMargin: 5
                left: parent.left
                leftMargin: 5
                right: parent.right
                rightMargin: 5                
                bottom: parent.bottom
                bottomMargin: 10
            }
            source: source
        }
    }
}

// vi:sts=4:sw=4:et
