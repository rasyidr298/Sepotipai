//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Agatha Rachmat on 07/07/21.
//

import SwiftUI

struct Song: Identifiable {
    var id = UUID()
    var singer: String
    var title: String
}

struct ContentView: View {
    var playlist = [
        Song(singer: "U2", title: "Elevation"),
        Song(singer: "Ciara", title: "Level up"),
        Song(singer: "BridgeBoys", title: "Ka MoNANYA"),]
    
    
    
    @State private var titleSongPlayed : String = ""
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
                        }
                    }, label: {
                        if isPlayingSomething{
                            Image(systemName: "pause.circle.fill").font(.system(size: 56)).foregroundColor(.blue)
                        }else{
                            Image(systemName: "play.circle.fill").font(.system(size: 56)).foregroundColor(.green)
                        }
                        
                    })
                    Text(titleSongPlayed)
                }.frame(width: 350, height: 100, alignment: .leading)
                
                List(playlist){ i in
                    SongCellCustom(song: i)
                        .onTapGesture {
                            titleSongPlayed = i.singer + " - " + i.title
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

import AVFoundation

class AVService{
    var player : AVAudioPlayer?
    static let shared = AVService()
    
    func playMusic(){
        //akses alamat
        let path = Bundle.main.path(forResource: "music", ofType:"wav") ?? ""
        //ubah alamatnya jadi url
        let url = URL(fileURLWithPath: path)
        do {
            //masukin url ke audio player
            player = try AVAudioPlayer(contentsOf: url)
            
            //player di mainkan
            player?.play()
        } catch {
            // couldn't load file :(
        }
    }
}

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
