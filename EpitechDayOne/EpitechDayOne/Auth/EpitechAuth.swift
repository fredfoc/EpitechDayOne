//
//  AuthProtocol.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

enum ResultAuth {
    case success(String)
    case failure(Error)
}

protocol EpitechAuth {
    func signInUser(email:String, password: String, completion: @escaping (ResultAuth) -> ())
}
