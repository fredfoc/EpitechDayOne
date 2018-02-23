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
    func signInUser(email: String?,
                    password: String?,
                    completion: @escaping (ResultAuth) -> ()) {
        guard let email = email else {
            completion(ResultAuth.failure(ErrorAuth.emailIsNil))
            return
        }
        guard let password = password else {
            completion(ResultAuth.failure(ErrorAuth.passwordIsNil))
            return
        }
        guard email.isValidEmail else {
            completion(ResultAuth.failure(ErrorAuth.emailIsInvalid))
            return
        }
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
