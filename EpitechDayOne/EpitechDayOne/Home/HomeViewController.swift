//
//  HomeViewController.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 22/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa

protocol HomeView: class {
    func receiveData(results: [UserModel])
    func displayError(error: String)
    var searchTextField: UITextField?{get}
}

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterImp?
    
    @IBOutlet weak var searchTextField: UITextField?
    @IBOutlet private weak var collectionView: UICollectionView!
    private var displayResults = [UserModel]()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath)
        if let cell = cell as? ResultCollectionViewCell {
            cell.setModel(model: displayResults[indexPath.row])
        }
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.cellWasSelected(indexPath: indexPath)
    }
}

extension HomeViewController: HomeView {
    func receiveData(results: [UserModel]) {
        displayResults = results
        collectionView.reloadData()
    }
    func displayError(error: String) {
        print(error)
    }
}
