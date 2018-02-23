//
//  FakeAuthImp.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

struct FakeAuthImp {
    
}

extension FakeAuthImp: EpitechAuth {
    func signInUser(email: String, password: String, completion: @escaping (ResultAuth) -> ()) {
        completion(ResultAuth.success("fredfocmac@gmail.com"))
    }
}
