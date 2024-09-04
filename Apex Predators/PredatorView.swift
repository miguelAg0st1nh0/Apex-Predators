//
//  PredatorView.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 05/09/2024.
//

import SwiftUI

struct PredatorView: View {
    let predator: ApexPredator
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack {
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(x: 60, y: 30)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorView(predator: Predators().apexPredators[2])
}
