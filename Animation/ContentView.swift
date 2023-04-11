//
//  ContentView.swift
//  Animation
//
//  Created by Edmond Podlegaev on 07.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isEnabled = false
    
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
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
