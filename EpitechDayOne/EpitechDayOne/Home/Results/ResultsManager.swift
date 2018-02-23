//
//  ResultsManager.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation

protocol ResultsManager: class {
    var results: [UserModel] {get set}
}

class ResultsManagerImp: ResultsManager {
    var results = [UserModel]()
    static let sharedInstance = ResultsManagerImp()
    private init() {}
}
