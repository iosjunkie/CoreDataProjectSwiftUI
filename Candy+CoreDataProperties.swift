//
//  Candy+CoreDataProperties.swift
//  CoreDataProjectSwiftUI
//
//  Created by Jules Lee on 1/8/20.
//  Copyright © 2020 Jules Lee. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown candy"
    }
}
