//
//  AuthManager.swift
//  FireBaseTests
//
//  Created by Аня Голубева on 20.10.2020.
//  Copyright © 2020 Аня Голубева. All rights reserved.
//

import Firebase

public class AuthManager{
    static let shared = AuthManager ()
    
    
    public func registerNewUser(username: String, email: String, password: String) {
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email =  email{
            Auth.auth().signIn(withEmail: email, password: password) { (Authresult, error) in
                guard Authresult != nil , error == nil else{
                    completion(false)
                    return
                }
                
                completion(true)
            }
        }
        else if let username = username{
            print(username)
        }
    }
}
