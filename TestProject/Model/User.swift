//
//  User.swift
//  TestProject
//
//  Created by Сергей on 14.04.2022.
//

import RealmSwift
import UIKit

// Model to save user data
class User: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var bio: String = ""
    @objc dynamic var avatarImageData: Data = Data()
    @objc dynamic var coverImageData: Data = Data()
    
    convenience init(name: String, bio: String, avatarImageData: Data, coverImageData: Data) {
        self.init()
        self.name = name
        self.bio = bio
        self.avatarImageData = avatarImageData
        self.coverImageData = coverImageData
    }
}
