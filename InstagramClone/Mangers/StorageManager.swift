//
//  StorageManager.swift
//  InstagramClone
//
//  Created by Desanka MIlakovic on 16.4.21..
//

import Foundation
import FirebaseStorage

final class StorageManager {
    static let shared = StorageManager()
    private init() {}
    
    let storage = Storage.storage()
}
