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
    var playlist = [Song(singer: "U2", title: "Elevation"), Song(singer: "Ciara", title: "Level up")]
    
    var body: some View {
        NavigationView(){
        VStack{
            //Text("Playlist").font(.largeTitle)
            HStack{
                Button(action: {
                    print("play Playlist")
                }, label: {
                    Image(systemName: "play.circle.fill").font(.system(size: 56)).foregroundColor(.green)
                })
                Button(action: {
                    print("play Playlist")
                }, label: {
                    Text("❤️")
                })
            }.frame(width: 350, height: 100, alignment: .leading)
            List(playlist){ i in
                    Text(i.singer + " - " + i.title)
            }
        }.navigationBarTitle(Text("PlayList")).foregroundColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
