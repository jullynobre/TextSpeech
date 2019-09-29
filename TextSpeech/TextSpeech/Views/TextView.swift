//
//  TextView.swift
//  TextSpeech
//
//  Created by Diuli Nobre on 29/09/19.
//  Copyright © 2019 Diuli Nobre. All rights reserved.
//

import SwiftUI
import UIKit

struct TextView: UIViewRepresentable {
    typealias UIViewType = UITextView

    func makeUIView(context: UIViewRepresentableContext<TextView>) -> UITextView {
        let textView = UITextView()
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 10.0
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<TextView>) {
        //Update UITextView state
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
