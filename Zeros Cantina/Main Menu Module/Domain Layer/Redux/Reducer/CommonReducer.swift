//
//  CommonReducer.swift

//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

let commonReducer: Reducer<AppState, AppMenuAction.CommonAction> = Reducer { state, action in
    
    
    
    func playMusic() {
        guard let path = Bundle.main.path(forResource: "menu_music", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func stopMusic() {
        player?.stop()
        player = nil
    }
    
    switch action {
    case .setIsAlert(let presented):
        state.isAlertPresented = presented
        
    case .showAlert(let style):
        state.alertStyle = style
        state.isAlertPresented = true
        
    case .setIsLoaderPresented(let presented):
        state.isLoaderPresented = presented
    case .set(isMusicOn: let isMusicOn):
        if isMusicOn {
            playMusic()
        } else {
            stopMusic()
        }
        state.isMusicOn = isMusicOn
    case .setInitialActionsDone:
        state.areInitialActionsPerformed = true
    }
    
    return nil
}
