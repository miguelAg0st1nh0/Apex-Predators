//
//  Predators.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 02/09/2024.
//

import Foundation

class Predators {
    
    ///Initialise an empty Array of type: `ApexPredator` to be populated with data from a JSON file.
    var apexPredators: [ApexPredator] = []
    
    /// Upon instantiation of the class, the function `decodeApexPredatorData` is called to provide data from JSON file
    ///
    init() {
        decodeApexPredatorData()
    }
    
    /// This function gets the URL of a local JSON file within the project folder.
    /// Safely, tries to read this data from variable `url` to then decode it.
    ///
    ///The following line populates the initial empty array with data retrieved from the JSON file, assuming there are no errors while trying to do so.
    /// ```swift
    /// apexPredators = try decoder.decode([ApexPredator].self, from: data)
    ///
    /// ```
    /// > Important: The JSON file  has some variables written using the `SnakeCase`, so the variable decoder needs to be converted from this to `CamelCase` to avoid errors.
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("Error decoding JSON file: \(error)")
            }
            
        }
    }
    
}
