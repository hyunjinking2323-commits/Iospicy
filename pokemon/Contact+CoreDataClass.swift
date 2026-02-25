//
//  Contact+CoreDataClass.swift
//  pokemon
//
//  Created by t2025-m0239 on 2026.02.24.
//
//

public import Foundation
public import CoreData



public typealias PhoneBookSet = NSSet

@objc(PhoneBook)
public class PhoneBook: NSManagedObject {
    public static let className = "PhoneBook"
    public enum Key {
        static let image = "image"
        static let name = "name"
        static let phoneNumber = "phoneNumber"
    }
}
