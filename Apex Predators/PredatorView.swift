//
//  PredatorView.swift
//  Apex Predators
//
//  Created by Miguel Agostinho on 05/09/2024.
//

import SwiftUI
import MapKit

struct PredatorView: View {
    
    @State var position: MapCameraPosition
    let predator: ApexPredator
    @Environment(\.colorScheme) var currentScheme

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack {
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay(){
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                Gradient.Stop(color: ColorSchemeManager.returnSameColorScheme(for: currentScheme), location: 1)
                                ],
                                    startPoint: .top, endPoint: .bottom)
                        }
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                        .scaleEffect(x: -1)
                        .shadow(color: ColorSchemeManager.dynamicColor(for: currentScheme), radius: 2)
                        .offset(x: 70, y: 40)
                        
                }
                VStack (alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                        .padding(.bottom, 10)
                    VStack(alignment: .leading) {
                        Text("● Height: \(predator.height)")
                        Text("● Lenght: \(predator.lenght)")
                        Text("● Weight: \(predator.weight)")
                    }
                    .font(.system(size: 15))
                    .fontDesign(.rounded)
                    .fontWeight(.light)
                    .padding(.leading, 15)
                    
                    
                    
                    NavigationLink{
                        PredatorMap(position: .camera(MapCamera(centerCoordinate: predator.location, distance: 1000, heading: 250, pitch: 80)))
                    } label: {
                        Map(position: $position) {
                            Annotation(predator.name, coordinate: predator.location) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden)
                        }
                        .frame(height: 250)
                        .clipShape(.rect(cornerRadius: 15))
                    }
                    
                    Text("Appears in: ")
                        .font(.title3)
                        .padding(.top)
                    
                    ForEach(predator.movies, id: \.self) {movie in
                        Text("•"+movie)
                            .font(.subheadline)
                            .fontWeight(.light)
                    }
                    Text("Movie Moments:")
                        .font(.title)
                        .padding(.top, 15)
                        
                    ForEach(predator.movieScenes) { movieScene in
                        Text(movieScene.movie)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.vertical, 5)
                        Text(movieScene.sceneDescription)
                            .fontDesign(.rounded)
                            .fontWeight(.light)
                            .padding(.bottom, 15)
                    }
                    
                    Text("Read More: ")
                    
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                        .padding(.bottom, 15)
                    
                }
                .padding()
                .frame(width: geo.size.width, alignment: .leading)
                
            }
            .ignoresSafeArea()
        }
        .toolbarBackground(.automatic)
    }
}


///Preview that allows the user to test a single dinossaur in the preview according to the index passed on the array ``Predators().apexPredators[index]``
#Preview {
    NavigationStack {
        PredatorView(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[1].location, distance: 30000)), predator: Predators().apexPredators[1])
    }
}
