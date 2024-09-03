//
//  ContentView.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 02/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var darkMode
    @State private var schemeColor: Color = .white
    
    @State private var searchText = ""
    let predators = Predators()
    
    var filteredPredators: [ApexPredator] {
        
        if searchText.isEmpty {
            return predators.apexPredators
        } else {
            return predators.apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        
        
        NavigationStack {
            List(filteredPredators) { predator in
                NavigationLink {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        
                    
                } label: {
                    
                    HStack {
                        //Dinossaur Image
                        Image(predator.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .shadow(color: schemeColor, radius: 3)
                        VStack(alignment: .leading) {
                            //Dinossaur Name
                            Text(predator.name)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .font(.system(size: 20))
                            //Dinossaur Type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 13)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    } .onAppear(){
                        getColorScheme()
                    }
                }
                
            }
            .navigationTitle("Apex Predators  🦅")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.interactiveSpring, value: searchText)
        }
        
    }
    
    
    ///Custom function that automatically changes the dinossaur image shadow property to the inverse of the current color scheme.
    ///
    func getColorScheme() {
        if darkMode == .dark{
            schemeColor = .white
        } else {
            schemeColor = .black
        }
    }
}



#Preview {
    ContentView()
}
