//
//  SpeechService.swift
//  TextSpeech
//
//  Created by Diuli Nobre on 20/09/19.
//  Copyright © 2019 Diuli Nobre. All rights reserved.
//

import Speech
import Foundation

class SpeechService {
    
    let audioEngine = AVAudioEngine()
    let speechRecognizer: SFSpeechRecognizer?
    let request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    
    init(locale: LocaleIdentifier) {
        self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: locale.rawValue))
    }
    
    func startRecording(completion: @escaping (String) -> Void) throws {
        if !self.requestAuthorization() {
            return
        }
        
        let node = audioEngine.inputNode
        let recordingFormat = node.outputFormat(forBus: 0)
        
        node.installTap(onBus: 0, bufferSize: 1024,
                        format: recordingFormat) { [unowned self]
                            (buffer, _) in
                            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        try audioEngine.start()
        
        recognitionTask = speechRecognizer?.recognitionTask(with: request) { (result, _) in
            if let transcription = result?.bestTranscription {
                print(transcription.formattedString)
                completion(transcription.formattedString)
                //self.textLabel.text = transcription.formattedString
            }
        }
    }
    
    private func requestAuthorization() -> Bool {
        var authorizer: Bool = false
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            switch authStatus {
            case .authorized:
                authorizer = true
            default:
                authorizer = false
            }
        }
        return authorizer
    }
    
}
