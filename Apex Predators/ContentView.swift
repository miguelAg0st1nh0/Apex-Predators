//
//  ContentView.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 02/09/2024.
//

import SwiftUI
import MapKit

/// The main view of the app, displaying a list of predators with options to filter, sort, and search them.
struct ContentView: View {
    
    /// Automatically adapts to the current system color scheme (light or dark mode).
    @Environment(\.colorScheme) var colorScheme
    
    /// State variable that stores the current color, defaulting to white.
    @State private var currentColor: Color = .white
    
    /// State variable that stores the current selection for filtering predators by type.
    @State private var currentSelection = PredatorType.all
    /// State variable for sorting predators alphabetically or by ID.
    @State private var alphabetical = true
    /// State variable for storing the user's search input.
    @State private var searchText = ""
    
    /// Accesses the predators data from the `Predators` class.
    let predators = Predators()
    
    /// Computed property that filters and sorts the predators based on user input.
    var filteredPredators: [ApexPredator] {
        /// Filters the predators based on the currently selected type.
        predators.filter(by: currentSelection)
        /// Sorts the predators alphabetically or by ID, based on the `alphabetical` toggle.
        predators.sort(by: alphabetical)
        /// Returns the predators matching the search query.
        return predators.search(for: searchText)
    }
    
    var body: some View {
        
        /// Navigation view containing the list of filtered predators.
        NavigationStack {
            List(filteredPredators) { predator in
                /// Creates a navigation link for each predator, leading to a detailed view.
                NavigationLink {
                    /// The destination view shows the predator on a map with a 3D camera effect.
                    PredatorView(position: .camera(MapCamera(centerCoordinate: predator.location, distance: 30000)), predator: predator)
                    
                } label: {
                    
                    HStack {
                        /// Displays the predator's image with a shadow, resized to fit within a 100x100 frame.
                        Image(predator.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .shadow(color: ColorSchemeManager.dynamicColor(for: colorScheme), radius: 3)
                        
                        /// Vertical stack for displaying the predator's name, type, and diet.
                        VStack(alignment: .leading) {
                            /// Displays the predator's name with bold, rounded font styling.
                            Text(predator.name)
                                .fontWeight(.bold)
                                .fontDesign(.rounded)
                                .font(.system(size: 18))
                            HStack {
                                /// Displays the predator's type inside a capsule shape, with its corresponding background color.
                                Text(predator.type.rawValue.capitalized)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background(predator.type.background)
                                    .clipShape(.capsule)
                                
                                /// Displays the predator's diet inside a capsule shape, with its corresponding background color.
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
                    }
                }
            }
            /// Sets the navigation title to "Apex Predators".
            .navigationTitle("Apex Predators")
            /// Adds a search bar to filter predators by name.
            .searchable(text: $searchText)
            /// Disables autocorrection for the search bar.
            .autocorrectionDisabled()
            /// Animates the appearance of search results using a spring effect.
            .animation(.interactiveSpring, value: searchText)
            
            .toolbar {
                /// Toolbar button for toggling between alphabetical and ID sorting.
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        /// Toggles the sorting order with an animation.
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
                        /// Displays an icon representing the current sorting method (alphabetical or by ID).
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                            .foregroundColor(ColorSchemeManager.dynamicColor(for: colorScheme))
                    }
                }
            }
            
            .toolbar {
                /// Toolbar menu for filtering predators by type.
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        /// Picker for selecting a predator type to filter the list.
                        Picker("Filter", selection: $currentSelection.animation(.spring)) {
                            ForEach(PredatorType.allCases) { type in
                                /// Displays each type as a label with its corresponding icon.
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        /// Displays the filter menu icon.
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(ColorSchemeManager.dynamicColor(for: colorScheme))
                    }
                }
            }
        }
    }
}

#Preview {
    /// Preview for `ContentView`, showing how it will appear in SwiftUI's preview canvas.
    ContentView()
}
