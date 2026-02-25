//
//  Contact+CoreDataProperties.swift
//  pokemon
//
//  Created by t2025-m0239 on 2026.02.24.
//
//

public import Foundation
public import CoreData


public typealias ContactCoreDataPropertiesSet = NSSet

extension PhoneBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?

}

extension PhoneBook : Identifiable {

}
