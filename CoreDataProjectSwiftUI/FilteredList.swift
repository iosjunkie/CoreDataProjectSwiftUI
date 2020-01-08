//
//  FilteredList.swift
//  CoreDataProjectSwiftUI
//
//  Created by Jules Lee on 1/8/20.
//  Copyright © 2020 Jules Lee. All rights reserved.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
    let content: (T) -> Content
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINWITH %@", filterKey, filterValue))
        self.content = content
    }
}
