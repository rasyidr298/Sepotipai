//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Agatha Rachmat on 07/07/21.
//

import SwiftUI


struct ContentView: View {
    var playlist = [
        Song(singer: "U2", title: "Elevation"),
        Song(singer: "Ciara", title: "Level up"),
        Song(singer: "BridgeBoys", title: "Ka MoNANYA"),]
    
    @State private var playingSong : Song = Song(singer: "", title: "")
    @State private var isPlayingSomething : Bool = false
    
    
    var body: some View {
        NavigationView(){
            VStack{
                HStack{
                    Button(action: {
                        print("play Playlist")
                        isPlayingSomething.toggle()
                        if !isPlayingSomething{
                            AVService.shared.player?.stop()
                        }else{
                            if playingSong.singer == "BridgeBoys"{
                                AVService.shared.playMusic()
                            }
                        }
                    }, label: {
                        if isPlayingSomething{
                            Image(systemName: "pause.circle.fill").font(.system(size: 56)).foregroundColor(.blue)
                        }else{
                            Image(systemName: "play.circle.fill").font(.system(size: 56)).foregroundColor(.green)
                        }
                        
                    })
                    Text(playingSong.title + " - " + playingSong.singer)
                       
                }.frame(width: 350, height: 100, alignment: .leading)
                
                List(playlist){ i in
                    SongCellCustom(song: i)
                        .onTapGesture {
                            playingSong = i
                            if i.singer == "BridgeBoys"{
                                AVService.shared.playMusic()
                            }
                            isPlayingSomething = true
                        }
                }
                
            }
        }
    }
    
   
}




