//
//  TextToSpeechView.swift
//  TextSpeech
//
//  Created by Diuli Nobre on 20/09/19.
//  Copyright © 2019 Diuli Nobre. All rights reserved.
//

import SwiftUI

struct TextToSpeechView : View {
    var body: some View {
        VStack{
            Button(action: speakButtonAction) {
                Image(systemName: "play.fill")
            }.padding(16).imageScale(.large)
        }.padding(.all)
    }
    
    func speakButtonAction() {
        print("Did Tap Speak Button")
    }
}

#if DEBUG
struct TextToSpeechView_Previews : PreviewProvider {
    static var previews: some View {
        TextToSpeechView()
    }
}
#endif
