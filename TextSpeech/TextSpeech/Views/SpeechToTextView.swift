//
//  ContentView.swift
//  TextSpeech
//
//  Created by Diuli Nobre on 20/09/19.
//  Copyright © 2019 Diuli Nobre. All rights reserved.
//

import SwiftUI

struct SpeechToTextView : View {
    @State private var name: String = "Your speech will appear here!"
    @State private var isRecording: Bool = false
    
    let speechService = SpeechService(locale: .ptBR)
    
    var body: some View {
        VStack {
            Text("Your Speech Will Appear Here!")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            Spacer()
            Button(action: recordButtonAction) {
                Image(systemName: "play.fill")
            }.padding(16)
        }.padding()
    }
    
    func recordButtonAction() {
        do {
            try speechService.startRecording { (transcription) in
                self.name = transcription
            }
        } catch {
            print(error)
        }
        print("Did Tap Recod Button")
    }
}

#if DEBUG
struct SpeechToTextView_Previews : PreviewProvider {
    static var previews: some View {
        SpeechToTextView()
    }
}
#endif
