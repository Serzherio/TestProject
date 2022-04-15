//
//  StorageManager.swift
//  TestProject
//
//  Created by Сергей on 15.04.2022.
//

import RealmSwift


let realm = try! Realm()

class StorageManager {
    
    static func saveUser(_ user: User) {
        try! realm.write{
            realm.add(user)
        }
    }
    
    static func deleteUser(_ user: User) {
        try! realm.write {
            realm.delete(user)
        }
    }
    
}
