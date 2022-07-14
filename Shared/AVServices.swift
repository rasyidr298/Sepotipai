//
//  AVServices.swift
//  SwiftUITutorial
//
//  Created by Muhammad Tafani Rabbani on 14/07/22.
//

import Foundation
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
