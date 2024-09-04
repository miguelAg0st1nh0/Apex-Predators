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
    var allApexPredators: [ApexPredator] = []
    
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
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("Error decoding JSON file: \(error)")
            }
            
        }
    }
    
    func search(for searchText: String) -> [ApexPredator] {
        if searchText.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort { predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type: PredatorType) {
        if type == .all {
            apexPredators = allApexPredators
        } else {
                apexPredators = allApexPredators.filter { predator in
                predator.type == type
            }
        }
    }
}
