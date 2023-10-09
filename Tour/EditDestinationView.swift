//
//  EditDestinationView.swift
//  Tour
//
//  Created by Jai  on 10/10/23.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    @Bindable var destination: Destination
    var body: some View {
        Form {
            TextField("Name",text: $destination.name)
            TextField("Details", text: $destination.detail,axis: .vertical)
            DatePicker("Date",selection: $destination.date)
            Section("Priority"){
                Picker("Priority",selection: $destination.priority){
                    Text("Maybe")
                    Text("Important")
                    Text("Very Important")
                }
                .pickerStyle(.segmented)
                
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Example Destination",detail: "fnjvndjvndkvnkdjnvkdvnjdbvkdvbdjknvfhugndkfjbvdiouvhd")
        return EditDestinationView(destination: example)
            .modelContainer(container)
    
    } catch{
        fatalError("Failed To Create Model Container")
    }
  
}
