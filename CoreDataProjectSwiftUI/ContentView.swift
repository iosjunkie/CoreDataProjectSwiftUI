//
//  ContentView.swift
//  CoreDataProjectSwiftUI
//
//  Created by Jules Lee on 1/7/20.
//  Copyright © 2020 Jules Lee. All rights reserved.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptor: []) var wizards: FetchedResults<Wizard>
    @FetchRequest(entity: Ship.entity(), sortDescriptor: [], predicate: [
        NSPredicate(format: "universe == 'Star Wars'")
    ]) var ships: FetchedResults<Ship>
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Examples") {
                let ship1 = Ship(context: self.moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Strek"
                
                let ship2 = Ship(context: self.moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Strek"
                
                let ship3 = Ship(context: self.moc)
                ship3.name = "Millenium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: self.moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
            }
//            List(wizards, id: \.self) { wizard in
//                Text(wizard.name ?? "Unknown")
//                Button("Add") {
//                    let wizard = Wizard(context: self.moc)
//                    wizard.name = "Harry Potter"
//                }
//                Button("Save") {
//                    do {
//                        try self.moc.save()
//                    } catch {
//                        print(error.localizedDescription)
//                    }
//                }
//
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
