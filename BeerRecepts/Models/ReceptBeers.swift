//
//  Entity+CoreDataClass.swift
//  BeerRecepts
//
//  Created by  Yaroslav on 28.11.21.
//
//

import Foundation
import CoreData

@objc(ReceptBeers)
public class ReceptBeers: NSManagedObject, Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReceptBeers> {
        return NSFetchRequest<ReceptBeers>(entityName: "ReceptBeers")
    }

    @NSManaged public var beer: String
    @NSManaged public var beerImageUrl: String
    @NSManaged public var beerDescription: String
    @NSManaged public var beerAbv: Double
    @NSManaged public var beerTagline: String

}


