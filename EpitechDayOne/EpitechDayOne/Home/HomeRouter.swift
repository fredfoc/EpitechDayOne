//
//  HomeRouter.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit

protocol HomeRouter {
    func cellWasSelected(user: UserModel)
}

struct HomeRouterImp {
    var view: UIViewController?
}

extension HomeRouterImp: HomeRouter {
    func cellWasSelected(user: UserModel) {
        if let detailViewController = UIStoryboard(name: "Main",
                                                   bundle: nil).instantiateViewController(withIdentifier: "detailVC") as? UserDetailViewController {
            detailViewController.setModel(model: user)
            view?.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
