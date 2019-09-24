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
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            switch authStatus {
            case .authorized:
                do {
                    try self.recognize(completion: completion)
                }
                catch {
                    print(error)
                }
            default:
                print("Non Authorized")
            }
        }
    }
    
    private func recognize(completion: @escaping (String) -> Void) throws {
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
    
    func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "pt-BR")
        utterance.rate = 0.1
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}
