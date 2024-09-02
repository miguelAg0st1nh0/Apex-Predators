//
//  ApexPredator.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 02/09/2024.
//

import Foundation

/// A struct that conforms to the JSON data, following a protocol of `Decodable`
/// > Alert: variables need to match the name and format of those in the JSON file.
/// Camel and Snake Cases are handled in a different swift file. If the JSON file has a variable: "movie_scenes"
/// in snake case, this can be easily converted to camel case by using  ``.convertFromSnakeCase`` to accept "movieScenes".
struct ApexPredator: Decodable {
    
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [movieScene]
    let link: String
    
    ///A struct within ``ApexPredator`` to populate the array: ``movieScenes`` to conform to JSON file structure.
    ///This struct also needs to conform to the ``Decodable`` protocol.
    
    struct movieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
        
    }
    
}
