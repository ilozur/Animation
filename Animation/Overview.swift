//
//  Overview.swift
//  Animation
//
//  Created by Edmond Podlegaev on 07.04.2023.
//

import SwiftUI

struct Overview: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap me!") {
            animationAmount += 1
        }
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
        
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 2)
            .animation(.default, value: animationAmount)
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview()
    }
}
