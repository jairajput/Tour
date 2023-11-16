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
    @State private var newSightName  = ""
    var body: some View {
        Form{
            TextField("Name",text: $destination.name)
            TextField("Details", text: $destination.detail,axis: .vertical)
            DatePicker("Date",selection: $destination.date)
            Section("Priority"){
                Picker("Priority",selection: $destination.priority){
                    Text("Maybee")
                    Text("Important")
                    Text("Very Important")
                }
                .pickerStyle(.segmented)
                
            }
            //Section("Sight"){
            //                ForEach(destination.sight){sight in
            //                    Text(sight.name)
            //                }
            //                    HStack{
            //                        TextField("Add A New Sigh in \(destination.name)",text: $newSightName)
            //                        Button("Add",action: addSight)
            //                    }
            //                }
            //
            
            Section("Sight"){
                ForEach(destination.sights){sight in
                    
                    
                    Text(sight.name)
                }
                
                HStack {
                    TextField("Add a new sight in \(destination.name)", text: $newSightName)
                    
                    Button("Add", action: addSight)
                }
            }
        }        .navigationTitle("Edit Destination")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    func addSight() {
        guard newSightName.isEmpty == false else { return }
        
        withAnimation {
            let sight = Sight(name: newSightName)
            destination.sights.append(sight)
            newSightName = ""
        }
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
