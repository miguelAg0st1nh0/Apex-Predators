//
//  ApexPredator.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 02/09/2024.
//

import Foundation
import SwiftUI
import MapKit

/// A struct that conforms to the JSON data, following a protocol of `Decodable`
/// > Alert: variables need to match the name and format of those in the JSON file.
/// Camel and Snake Cases are handled in a different swift file. If the JSON file has a variable: "movie_scenes"
/// in snake case, this can be easily converted to camel case by using  .convertFromSnakeCase to accept "movieScenes".
struct ApexPredator: Decodable, Identifiable {
    
    /// Unique identifier for the predator.
    let id: Int
    /// The name of the predator.
    let name: String
    /// The type of predator (e.g., land, air, sea).
    let type: PredatorType
    /// The latitude of the predator's location.
    let latitude: Double
    /// The longitude of the predator's location.
    let longitude: Double
    /// The length of the predator.
    let lenght: String
    /// The height of the predator.
    let height: String
    /// The weight of the predator.
    let weight: String
    /// List of movies the predator has appeared in.
    let movies: [String]
    /// An array of scenes from those movies where the predator appears.
    let movieScenes: [movieScene]
    /// A URL link to more information about the predator.
    let link: String
    /// The predator's diet (e.g., carnivore, herbivore).
    let diet: PredatorDiet
    
    /// Computed property to generate an image name by converting the predator's name to lowercase and removing spaces.
    /// This allows easy referencing of images stored locally, assuming the image name matches the modified predator name.
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
        
    }
    /// Computed property to provide the geographic location (latitude and longitude) of the predator as a `CLLocationCoordinate2D` object.
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    ///A struct within ``ApexPredator`` to populate the array: ``movieScenes`` to conform to JSON file structure.
    ///This struct also needs to conform to the ``Decodable`` protocol.
    struct movieScene: Decodable, Identifiable {
        /// Unique identifier for the movie scene.
        let id: Int
        /// Name of the movie in which the scene appears.
        let movie: String
        /// A description of the scene.
        let sceneDescription: String
        
    }
    
}

/// An enum that represents the diet of a predator, conforming to `Decodable`, `CaseIterable`, and `Identifiable`.
/// The two possible values are `carnivore` and `herbivore`.
enum PredatorDiet: String, Decodable, CaseIterable, Identifiable {
    
    case carnivore
    case herbivore
    
    /// The `id` property returns the case itself, which conforms to the `Identifiable` protocol.
    var id: PredatorDiet {
        self
    }
    
    /// Computed property that returns a `Color` based on the predator's diet.
    /// Carnivores are associated with red, and herbivores with green.
    var background: Color {
        switch self {
        case .carnivore:
            return .red
        case .herbivore:
            return .green
        }
    }
}

/// An enum that represents the type of predator, conforming to `Decodable`, `CaseIterable`, and `Identifiable`.
/// The predator type could be `land`, `air`, `sea`, or `all` (for predators found in multiple environments).
enum PredatorType: String, Decodable, CaseIterable, Identifiable {
    
    case all
    case land
    case air
    case sea
    
    /// The `id` property returns the case itself, which conforms to the `Identifiable` protocol.
    var id: PredatorType {
        self
    }
    
    /// Computed property that returns a `Color` based on the predator's type.
    /// Each environment is associated with a different color (e.g., land is brown, air is mint, sea is blue, and all is black).
    var background: Color {
        switch self {
        case .land:
            return .brown
        case .air:
            return .mint
        case .sea:
            return .blue
        case .all:
            return .black
        }
    }
    
    /// Computed property that returns a corresponding icon (from SF Symbols) for each predator type.
    /// These icons can be used in the UI to visually represent the predator's environment.
    var icon: String {
        switch self {
        case .all:
            return "square.stack.3d.up.fill"
        case .sea:
            return "drop.fill"
        case .land:
            return "leaf.fill"
        case .air:
            return "wind"
        }
    }
}
