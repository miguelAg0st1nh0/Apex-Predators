//
//  PredatorMap.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 08/09/2024.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    @State var position: MapCameraPosition
    
    let predators = Predators()
    
    var body: some View {
        Map(position: $position) {
            ForEach(predators.apexPredators) { predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .shadow(color: .white,radius: 3)
                        .scaleEffect(x: -1)
                    
                    
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[1].location, distance: 1000, heading: 250, pitch: 80)))
}
