//
//  ContentView.swift
//  medidraw
//
//  Created by Amyruth Rubio on 6/26/23.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    
    enum SoundOption: String {
        case finalMix
    }
    
    
    
    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
            
            
        }
    }
}




struct ContentView: View {
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                //green background color
                Color(red: 118/255, green: 148/255, blue: 117/255)
                    .ignoresSafeArea()
      
                VStack (spacing: 20.0){
                    Button("Play Sound") {
                        SoundManager.instance.playSound(sound : .finalMix)
                        //calls to play the sound
                        // Note: As of right now, the button only plays one song, not 100% sure how to fix that. - Moyo
                    }
                    
                    
                    //title
                    Text("Medidraw")
                        .font(.custom("Bauhaus93", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    //DrawingPage
                    NavigationLink(destination: DrawingPage()) {
                        Text("Draw       ") //we can add spacebars to adjust the background width
                            .font(.custom("Hiragino Kaku Gothic ProN", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color(red: 0.581, green: 0.625, blue: 0.581))
                            .cornerRadius(5)
                    }
                    //Info Page button link
                    NavigationLink(destination: InfoPage()) {
                        Text("Info")
                            .font(.custom("Hiragino Kaku Gothic ProN", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color(red: 0.581, green: 0.625, blue: 0.581))
                            .cornerRadius(5)
                    }
                    
                    //About Page button link
                    NavigationLink(destination: AboutPage()) {
                        Text("About")
                            .font(.custom("Hiragino Kaku Gothic ProN", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(10)
                            .background(Color(red: 0.581, green: 0.625, blue: 0.581))
                            .cornerRadius(5)
                    }

                }
                
                
                
            }
        }
        .accentColor(.white)  //makes navigation back button white
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
