//
//  Singer+CoreDataProperties.swift
//  CoreDataProjectSwiftUI
//
//  Created by Jules Lee on 1/8/20.
//  Copyright © 2020 Jules Lee. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    var wrappedFirstName: String {
        return firstName ?? "Unknown"
    }
    
    var wrappedLastName: String {
        return lastName ?? "Unknown"
    }
}
