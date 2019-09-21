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
    
    private let recordButtonLabel = {() in
        Text("Hello World")
    }
    
    var body: some View {
        VStack {
            Text(name)
                .font(.title)
                .bold()
                .padding(16)
                .lineLimit(nil)
            Spacer()
            Button(action: recordButtonAction, label: recordButtonLabel)
                .padding(16)
        }
    }
    
    func recordButtonAction() {
        self.name = "button tapped"
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
