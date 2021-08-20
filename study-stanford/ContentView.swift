//
//  ContentView.swift
//  study-stanford
//
//  Created by 김두리 on 2021/08/20.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗",  "🚘", "🚎", "🛴", "🚙", "🛻", "🚚", "🚛", "🚜", "🏎", "🏍", "🛵", "🦽", "🦼", "🛺", "🚲", "🛹", ]
    
    @State var emojiCount = 15
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 20))]) {
                    // ForEach는 id값을 필수로 인자로 받는다.
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.orange)
            Spacer()
            HStack{
                add
                Spacer()
                remove
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button(action: {
           if emojiCount > 1 { emojiCount -= 1}
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {emojiCount += 1}
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}

struct CardView: View {
    var content: String
    // 모든 View는 immutable, View 업데이트 시 rebuild, state 통해 로직구성
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            // Swift type 추론
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                // strokeBorder outside border 설정
                shape.strokeBorder(lineWidth: 3)
            Text(content)
                .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
