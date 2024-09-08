//
//  ContentView.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 02/09/2024.
//

import SwiftUI
import MapKit
    
struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var currentColor: Color = .white
    
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
                    PredatorView(position: .camera(MapCamera(centerCoordinate: predator.location, distance: 30000)), predator: predator)
                        
                } label: {
                    
                    HStack {
                        //Dinossaur Image
                        Image(predator.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .shadow(color: ColorSchemeManager.dynamicColor(for: colorScheme), radius: 3)
                        VStack(alignment: .leading) {
                            //Dinossaur Name
                            Text(predator.name)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .font(.system(size: 18))
                            HStack{
                                //Dinossaur Type
                                Text(predator.type.rawValue.capitalized)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background(predator.type.background)
                                    .clipShape(.capsule)
                                //Dinossaur Diet
                                Text(predator.diet.rawValue.capitalized)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background(predator.diet.background)
                                    .clipShape(.capsule)
                            }
                            
                            
                        }
                    } .onAppear(){
                        
                    }
                }
                
            }
            //Title
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.interactiveSpring, value: searchText)
            .toolbar {
                //Toolbar sort options
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation{
                            alphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                            .foregroundColor(ColorSchemeManager.dynamicColor(for: colorScheme))
                    }
                    
                }
            }
            .toolbar() {
                //Toolbar filter options
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentSelection.animation(.spring)) {
                            ForEach(PredatorType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(ColorSchemeManager.dynamicColor(for: colorScheme))
                    }
                    
                }
            }
        }
        
    }
    
}



#Preview {
    ContentView()
}
