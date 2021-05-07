//
//  AuthManager.swift
//  InstagramClone
//
//  Created by Desanka MIlakovic on 16.4.21..
//
// git add . git status git commit -m ""git push git log git branch
import Foundation
import FirebaseAuth

final class AuthManager {
    
    static let shared = AuthManager()
    
    init() {}
    
    public var isSignedIn: Bool {
       return auth.currentUser != nil
    }
    
    let auth = Auth.auth()
    
    public func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
    }
    public func signUp(email: String, username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
    }
    
    public func signOut(completion: @escaping (Bool) -> Void) {
        
    }
}
