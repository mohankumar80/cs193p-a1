//
//  ContentView.swift
//  Memorize
//
//  Created by Mohan Kumar Puram on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    
    let vehicleTheme = ["🚗", "🚎", "🏎️", "🚓", "🚑", "🚚", "🚜", "🛵", "🏍️", "🛺", "🚄", "🚗", "🚎", "🏎️", "🚓", "🚑", "🚚", "🚜", "🛵", "🏍️", "🛺", "🚄"]
    
    let halloweenTheme = ["👻", "🎃", "👹", "👺", "☠️", "😈", "💀", "🕷️", "🕸️", "🧟", "👻", "🎃", "👹", "👺", "☠️", "😈", "💀", "🕷️", "🕸️", "🧟"]
    
    let animalsTheme = ["🐶", "🐱", "🦊", "🐻", "🐼", "🐯", "🦁", "🐮", "🐒", "🐶", "🐱", "🦊", "🐻", "🐼", "🐯", "🦁", "🐮", "🐒"]
    
    @State var emojiTheme: [String] = ["🐶", "🐱", "🦊", "🐻", "🐼", "🐯", "🦁", "🐮", "🐒", "🐶", "🐱", "🦊", "🐻", "🐼", "🐯", "🦁", "🐮", "🐒"]
    
    var body: some View {
        TitleView
        Spacer()
        VStack {
            ScrollView{
                Cards
            }
            Spacer()
            ThemesAdjuster
        }
        .foregroundColor(.orange)
        .padding()
    }
    
    var Cards: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem(), GridItem()]) {
            ForEach(0..<emojiTheme.count, id: \.self) { index in
                CardView(Content: emojiTheme[index]).aspectRatio(2/3, contentMode: .fill)
            }
        }
    }
    
    var TitleView: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var ThemesAdjuster: some View {
        HStack {
            VehiclesTheme
            HalloweenTheme
            AnimalsTheme
        }.imageScale(.large)
            .font(.title)
    }
    
    func themeAdjuster(theme type: [String], symbol: String, name: String) -> some View {
        VStack {
            Button(action: {
                emojiTheme = type.shuffled()
            }, label: {
                Image(systemName: symbol)
            })
            Text(name).font(.caption)
        }
    }
    
    var VehiclesTheme: some View {
        themeAdjuster(theme: vehicleTheme, symbol: "car", name: "vehicles")
    }
    
    var HalloweenTheme: some View {
        themeAdjuster(theme: halloweenTheme, symbol: "hazardsign", name: "halloween")
    }
    
    var AnimalsTheme: some View {
        themeAdjuster(theme: animalsTheme, symbol: "pawprint.fill", name: "animals")
    }
}

struct CardView: View {
    @State var isFaceUp = false
    
    var Content: String
    
    let base = RoundedRectangle(cornerRadius: 12)
    var body: some View {
        ZStack {
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                Text(Content)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.font(.largeTitle)
            .onTapGesture {
                isFaceUp.toggle()
            }
    }
}

#Preview {
    ContentView()
}
