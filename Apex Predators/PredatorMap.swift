//
//  PredatorMap.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 08/09/2024.
//

import SwiftUI
import MapKit

/// A view that displays a map with annotations for each predator's location.
/// The map allows for interaction and camera positioning.
struct PredatorMap: View {
    /// The current camera position for the map, which can be adjusted by user interaction.
    @State var position: MapCameraPosition
    
    /// The list of all predators loaded from the `Predators` class.
    let predators = Predators()
    
    var body: some View {
        /// The `Map` view displays the predator locations and uses annotations to mark each location.
        /// The camera position is bound to the `position` state variable for dynamic updates.
        Map(position: $position) {
            /// Loop through each predator in the `apexPredators` array and create an annotation for its location.
            ForEach(predators.apexPredators) { predator in
                /// The annotation is represented by the predator's image.
                /// The image is resized, flipped horizontally (`scaleEffect(x: -1)`), and given a shadow effect.
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100) // Predetermined image size.
                        .shadow(color: .white, radius: 3) // Adds a white shadow for visual emphasis.
                        .scaleEffect(x: -1) // Flips the image horizontally.
                }
            }
        }
        /// Ensures the map view fills the entire screen, ignoring safe area insets.
        .ignoresSafeArea(.all)
    }
}

#Preview {
    /// The preview uses a camera positioned at the second predator's location
    /// with a specific distance, heading, and pitch for a dynamic visual experience.
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[1].location, distance: 1000, heading: 250, pitch: 80)))
}
