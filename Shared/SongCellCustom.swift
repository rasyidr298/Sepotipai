//
//  SongCellCustom.swift
//  SepotipaiW WatchKit Extension
//
//  Created by Muhammad Tafani Rabbani on 14/07/22.
//

import SwiftUI

struct SongCellCustom : View {
    let song : Song
    
    var body: some View{
        
        HStack{
            Text(song.singer + " - " + song.title)
            Spacer()
            Image(systemName: "play.circle.fill").font(.system(size: 30)).foregroundColor(.green)
        }
        
    }
}

struct SongCellCustom_Previews: PreviewProvider {
    static var previews: some View {
        SongCellCustom(song: Song(singer: "", title: ""))
    }
}
