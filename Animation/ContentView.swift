//
//  ContentView.swift
//  Animation
//
//  Created by Edmond Podlegaev on 07.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isEnabled = false
    @State private var dragAmount = CGSize.zero
    
    let letters = Array("Hello, SwiftUI")
    
    var body: some View {
        Button("Tap me") {
            isEnabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(isEnabled ? .blue : .red)
        .animation(nil, value: isEnabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: isEnabled)
        
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        dragAmount = .zero
                    }
            )
            .animation(.spring(), value: dragAmount)
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(isEnabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded {_ in
                    withAnimation {
                        dragAmount = .zero
                        isEnabled.toggle()
                    }
            }
        )
        
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
