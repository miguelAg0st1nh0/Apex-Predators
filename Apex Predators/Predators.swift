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
    /// A backup array that holds all the loaded predators from the JSON file.
    /// Used to restore the full list when resetting filters.
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
        //Locate the JSON file named "jpapexpredators" in the app's bundle
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            
            do {
                //Attempt to read the the contents odf the file into a variable 'data'
                let data = try Data(contentsOf: url)
                //Create a JSON DECODER instance to convert JSON Data into Swift Objects
                let decoder = JSONDecoder()
                //configure the decoder to convert from snake case keys in the JSON file to camel case
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                //Decode the JSON data into an array of 'ApexPredators' objects
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                //Initially set the main 'Apex Predators' to hold all the decoded data.
                apexPredators = allApexPredators
            } catch {
                //Fallback condition to handle any errors that might occur during the decoding process
                print("Error decoding JSON file: \(error)")
            }
            
        }
    }
    /// Searches through the `apexPredators` array for predators whose names contain the search text.
    /// If the search text is empty, it returns the entire list of predators.
    ///
    /// - Parameter searchText: The text to search for in the predator names.
    /// - Returns: A filtered array of `ApexPredator` objects that match the search criteria.
    func search(for searchText: String) -> [ApexPredator] {
        // If the search text is empty, return all predators.
        if searchText.isEmpty {
            return apexPredators
        } else {
            // Otherwise, filter the predators by checking if their name contains the search text.
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    /// Sorts the `apexPredators` array based on the selected sorting order.
    /// If alphabetical sorting is selected, it sorts by name. Otherwise, it sorts by predator ID.
    ///
    /// - Parameter alphabetical: A Boolean value indicating whether to sort alphabetically or by ID.
    
    func sort(by alphabetical: Bool) {
        // Sort predators based on the `alphabetical` parameter.
        apexPredators.sort { predator1, predator2 in
            if alphabetical {
                // Sort alphabetically by predator name.
                predator1.name < predator2.name
            } else {
                // Sort numerically by predator ID.
                predator1.id < predator2.id
            }
        }
    }
    
    /// Filters the `apexPredators` array based on the selected `PredatorType`.
    /// If the `all` type is selected, it restores the full list of predators.
    ///
    /// - Parameter type: The selected predator type to filter by.
    
    func filter(by type: PredatorType) {
        // If the selected type is `all`, show all predators.
        if type == .all {
            apexPredators = allApexPredators
        } else {
            // Otherwise, filter the predators based on their type.
            apexPredators = allApexPredators.filter { predator in
                predator.type == type
            }
        }
    }
}
