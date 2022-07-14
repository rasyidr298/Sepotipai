//
//  ParentView.swift
//  SepotipaiW WatchKit Extension
//
//  Created by Muhammad Tafani Rabbani on 14/07/22.
//

import SwiftUI

struct ParentView: View {
    @State var currentView = 1
    
    @State var isPlayingSomething : Bool = false
    @State var playingSong : Song?
    
    var body: some View {
        TabView(selection: $currentView) {
            ContentView(isPlayingSomething: $isPlayingSomething, playingSong: $playingSong).tag(1)
            ListSongView(isPlayingSomething: $isPlayingSomething, playingSong: $playingSong,tagView: $currentView).tag(2)
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
