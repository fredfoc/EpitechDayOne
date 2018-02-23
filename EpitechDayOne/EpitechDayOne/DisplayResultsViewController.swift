//
//  DisplayResultsViewController.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 22/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa

class DisplayResultsViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var results = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire
            .request("https://api.randomuser.me/?nat=US&results=5")
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    if let value = value as? [String: Any], let resultsJson = value["results"] as? [Any] {
                        self.results = resultsJson.map({ (data) -> UserModel in
                            if let data = data as? [String: Any], let name = data["name"] as? [String: Any]
                            {
                                return UserModel(name: name["last"] as! String)
                            }
                            return UserModel(name: "No Name")
                        })
                       self.collectionView.reloadData()
                    }
                case .failure(let error):
                    print("erreur \(error)")
                }
        }
    }
}

extension DisplayResultsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath)
        if let cell = cell as? ResultCollectionViewCell {
            cell.setModel(model: results[indexPath.row])
        }
        return cell
    }
    
    
}

extension DisplayResultsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detailViewController = UIStoryboard(name: "Main",
                                                   bundle: nil).instantiateViewController(withIdentifier: "detailVC") as? UserDetailViewController {
            detailViewController.setModel(model: results[indexPath.row])
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
