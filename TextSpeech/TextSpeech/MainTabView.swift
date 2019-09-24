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
        TabView {
            SpeechToTextView().tabItem {
                Text("Write my Speech")
                Image(systemName: "textbox")
            }.tag(1)
            TextToSpeechView().tabItem {
                Text("Speech my Text")
                Image(systemName: "text.bubble")
            }.tag(2)
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
