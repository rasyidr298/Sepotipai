//
//  ContentView.swift
//  SepotipaiW WatchKit Extension
//
//  Created by Muhammad Tafani Rabbani on 14/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var isPlayingSomething : Bool
    @Binding var playingSong : Song?
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment:.leading){
                    Text(playingSong?.title ?? "Judul Lagu")
                        .bold()
                    Text(playingSong?.singer ?? "Nama Artist")
                        .opacity(0.5)
                }
                Spacer()
            }
            
            playBtn
        }
    }
    
    
    var playBtn : some View{
        Button(action: {
            isPlayingSomething.toggle()
            if isPlayingSomething{
                AVService.shared.playMusic()
            }else{
                AVService.shared.player?.stop()
            }
        }, label: {
            if isPlayingSomething{
                Image(systemName: "pause.circle.fill").font(.system(size: 56)).foregroundColor(.blue)
            }else{
                Image(systemName: "play.circle.fill").font(.system(size: 56)).foregroundColor(.green)
            }
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isPlayingSomething: .constant(false), playingSong: .constant(nil))
    }
}
