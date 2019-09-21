//
//  MainTabView.swift
//  TextSpeech
//
//  Created by Diuli Nobre on 20/09/19.
//  Copyright © 2019 Diuli Nobre. All rights reserved.
//

import SwiftUI

struct MainTabView : View {
    var body: some View {
        TabbedView() {
            SpeechToTextView()
                .tabItemLabel(Text("Speech To Text")).tag(1)
            TextToSpeechView()
                .tabItemLabel(Text("Text To Speech")).tag(2)
        }
    }
}

#if DEBUG
struct MainTabView_Previews : PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
#endif
