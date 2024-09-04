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
    @State private var currentSelection = PredatorType.all
    @State private var alphabetical = true
    @State private var searchText = ""
    let predators = Predators()
    
    var filteredPredators: [ApexPredator] {
        predators.filter(by: currentSelection)
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        
        NavigationStack {
            List(filteredPredators) { predator in
                NavigationLink {
                    PredatorView(predator: predator)
                        
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
                                .font(.system(size: 18))
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation{
                            alphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                            .foregroundColor(schemeColor)
                    }
                    
                }
            }
            .toolbar() {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentSelection.animation(.spring)) {
                            ForEach(PredatorType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(schemeColor)
                    }
                    
                }
            }
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
