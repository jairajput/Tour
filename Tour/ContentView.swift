//
//  ContentView.swift
//  Tour
//
//  Created by Jai  on 09/10/23.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment (\.modelContext) var modelContext
    @Query var destinations : [Destination]
    @State private var path = [Destination]()
    var body: some View {
        NavigationStack(path: $path){
            
            List{
                ForEach(destinations){
                    destination in
                    NavigationLink(value:destination){
                        VStack(alignment: .leading){
                            Text(destination.name)
                                .font(.headline)
                            
                            Text(destination.date.formatted(date: .long, time: .shortened))
                        }
                        
                    }
                    
                }
                .onDelete(perform: deleteDestinations)
                
            }
            .navigationTitle("Tour 🚀")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar{
                Button("Add Destination", systemImage: "plus" ,action: addDestination)
            }
            
            
        }
    }
    
    
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
    func deleteDestinations (_ indexSet:IndexSet){
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
            path = [destination]
        }
    }
}

#Preview {
    ContentView()
}
