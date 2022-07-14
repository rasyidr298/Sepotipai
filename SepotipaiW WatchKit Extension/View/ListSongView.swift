//
//  ListSongView.swift
//  SepotipaiW WatchKit Extension
//
//  Created by Muhammad Tafani Rabbani on 14/07/22.
//

import SwiftUI

struct ListSongView: View {
    
    @Binding var isPlayingSomething : Bool
    @Binding var playingSong : Song?
    @Binding var tagView : Int
    
    var playlist = [
        Song(singer: "U2", title: "Elevation"),
        Song(singer: "Ciara", title: "Level up"),
        Song(singer: "BridgeBoys", title: "Ka MoNANYA"),]
    
    var body: some View {
        List(playlist){ i in
            SongCellCustom(song: i)
                .onTapGesture {
                    isPlayingSomething = true
                    playingSong = i
                    if playingSong?.singer == "BridgeBoys"{
                        AVService.shared.playMusic()
                    }
                    withAnimation {
                        tagView = 1
                    }
                }
        }
    }
}

struct ListSongView_Previews: PreviewProvider {
    static var previews: some View {
        ListSongView(isPlayingSomething: .constant(false), playingSong: .constant(nil), tagView: .constant(2))
    }
}
