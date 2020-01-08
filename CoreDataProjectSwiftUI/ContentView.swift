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
//    @FetchRequest(entity: Wizard.entity(), sortDescriptor: []) var wizards: FetchedResults<Wizard>
//    @FetchRequest(entity: Ship.entity(), sortDescriptor: [], predicate: [
//        NSPredicate(format: "universe == 'Star Wars'")
//    ]) var ships: FetchedResults<Ship>
    @FetchRequest(entity: Country.entity(), sortDescriptor: [
        NSPredicate(format: "shortName == %@", "UK")
    ]) var countries: FetchedResults<Country>
    @State var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(header: Text(country.wrappedFullName)) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add") {
                let candy1 = Candy(context: self.moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: self.moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                
                let candy2 = Candy(context: self.moc)
                candy2.name = "Kitkat"
                candy2.origin = Country(context: self.moc)
                candy2.origin?.shortName = "UK"
                cabdy2.origin?.fullName = "United Kingdom"
                
                let candy3 = Candy(context: self.moc)
                candy3.name = "Twix"
                candy3.origin = Country(context: self.moc)
                candy3.origin?.shortName = "UK"
                cabdy3.origin?.fullName = "United Kingdom"
                
                let candy4 = Candy(context: self.moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: self.moc)
                candy4.origin?.shortName = "CH"
                cabdy4.origin?.fullName = "Switzerland"
                
                try? self.moc.save()
            }
//            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
//                Text("\(singer.wrappedFirstName) \(self.wrappedLastName)")
//            }
//            Button("Add Examples") {
//                let taylor = Singer(context: self.moc)
//                taylor.firstName = "Taylor"
//                taylor.lastName = "Swift"
//
//                let ed = Singer(context: self.moc)
//                ed.firstName = "Ed"
//                ed.lastName = "Sheeran"
//
//                let adele = Singer(context: self.moc)
//                taylor.firstName = "Adele"
//                taylor.lastName = "Adkins"
//
//                try? self.moc.save()
//            }
//
//            Button("Show A") {
//                self.lastNameFilter = "A"
//            }
//
//            Button("Show S") {
//                self.lastNameFilter = "S"
//            }
//            List(ships, id: \.self) { ship in
//                Text(ship.name ?? "Unknown name")
//            }
//
//            Button("Add Examples") {
//                let ship1 = Ship(context: self.moc)
//                ship1.name = "Enterprise"
//                ship1.universe = "Star Strek"
//
//                let ship2 = Ship(context: self.moc)
//                ship2.name = "Defiant"
//                ship2.universe = "Star Strek"
//
//                let ship3 = Ship(context: self.moc)
//                ship3.name = "Millenium Falcon"
//                ship3.universe = "Star Wars"
//
//                let ship4 = Ship(context: self.moc)
//                ship4.name = "Executor"
//                ship4.universe = "Star Wars"
//            }
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
