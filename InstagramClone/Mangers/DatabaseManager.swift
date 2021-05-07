//
//  DatabaseManager.swift
//  InstagramClone
//
//  Created by Desanka MIlakovic on 16.4.21..
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    private init() {}
    
    let database = Firestore.firestore()
}
