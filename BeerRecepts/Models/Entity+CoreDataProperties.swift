//
//  Entity+CoreDataProperties.swift
//  BeerRecepts
//
//  Created by  Yaroslav on 28.11.21.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var recept: String?

}

extension Entity : Identifiable {

}
