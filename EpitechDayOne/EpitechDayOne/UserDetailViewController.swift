//
//  UserDetailViewController.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 22/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet private weak var userName: UILabel!
    private var model: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let model = model {
            title = "Detail " + model.name
        } else {
            title = "Pas de model"
        }
        
        userName.text = model?.name
    }
    
    func setModel(model: UserModel) {
        self.model = model
    }
}
