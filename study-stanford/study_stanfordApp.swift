//
//  study_stanfordApp.swift
//  study-stanford
//
//  Created by 김두리 on 2021/08/20.
//

import SwiftUI

@main
struct study_stanfordApp: App {
    var body: some Scene {
        // class는 참조형, 따라서 game은 EmojiMemoryGame class의 포인터 변수
        let game =  EmojiMemoryGame()
         
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
