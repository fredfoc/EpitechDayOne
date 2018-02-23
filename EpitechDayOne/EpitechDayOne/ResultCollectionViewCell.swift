//
//  ResultCollectionViewCell.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 22/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var myLabel: UILabel!
    
    func setModel(model: UserModel) {
        myLabel.text = model.name
    }
}
