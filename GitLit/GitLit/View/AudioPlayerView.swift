//
//  AudioPlayerView.swift
//  GitLit
//
//  Created by Field Employee on 9/21/21.
//


import SwiftUI
// Add AVkit to play audio files
import AVKit
import Firebase

struct AudioPlayerView: View {
    
    @State var audioPlayer: AVAudioPlayer!
    @State var count = 1
    @State var playerPaused = true
    
    var body: some View {
    
        VStack {
                Text("Play Music")
                    .font(.largeTitle)
            HStack {
                Spacer()
                Button(action: {
                      self.playerPaused.toggle()
                      if self.playerPaused {
                        self.audioPlayer.pause()
                      }
                      else {
                        self.audioPlayer.play()
                      }
                    }) {
                      Image(systemName: playerPaused ? "play" : "pause")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fit)
                    }
                Spacer()
                Button(action: {
                    self.playerPaused.toggle()
                    if self.playerPaused {
                      self.audioPlayer.pause()
                    }
                    else {
                        if self.count < 3 {
                            self.count += 1
                        } else {
                            self.count = 1
                        }
                        let sound = Bundle.main.path(forResource: "song\(self.count)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()
                    }
                    
                    
                }) {
                    Image(systemName: "forward.end").resizable()
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fit)
                }
                Spacer()
            }
        
        }

        .onAppear {
        let sound = Bundle.main.path(forResource: "song1", ofType: "mp3")
        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}



struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView()
    }
}
