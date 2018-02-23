//
//  UserModel.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 22/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

struct UserModel {
    private(set) var name: String
    init(name: String) {
        self.name = name
    }
    
    mutating func setName(value: String) {
        name = value
    }
}
