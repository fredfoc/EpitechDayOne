//
//  AuthImp.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation
import FirebaseAuth

struct EpitechAuthImp {
    
}

extension EpitechAuthImp: EpitechAuth {
    func signInUser(email: String,
                    password: String,
                    completion: @escaping (ResultAuth) -> ()) {
        Auth.auth().signIn(withEmail: email,
                           password: password,
                           completion: {(user, error) in
                            if let _ = user {
                                completion(ResultAuth.success(user?.email ?? "no email"))
                            }else if let error = error {
                                completion(ResultAuth.failure(error))
                            }
        })
    }
}
