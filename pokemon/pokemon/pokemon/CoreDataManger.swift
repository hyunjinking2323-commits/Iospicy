//
//  CoreDataManger.swift
//  pokemon
//
//  Created by t2025-m0239 on 2026.02.25.
//

import CoreData
import UIKit

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "pokemon")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

        // MARK: - CREATE
    func createPhoneBook(name: String, phoneNumber: String, imageData: Data) {
        let newContact = PhoneBook(context: context)
        newContact.name = name
        newContact.phoneNumber = phoneNumber
        newContact.image = imageData
        saveContext()
    }


    func fetchPhoneBooks() -> [PhoneBook] {
        let request: NSFetchRequest<PhoneBook> = PhoneBook.fetchRequest()
            // NSSortDescriptor를 사용하여 이름 기준 오름차순 정렬
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]

        do {
            return try context.fetch(request)
        } catch {
            print("데이터 불러오기 실패: \(error)")
            return []
        }
    }

        
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("저장 실패: \(error)")
            }
        }
    }
}
