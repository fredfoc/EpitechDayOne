//
//  HomePresenter.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation



protocol HomePresenter {
    func dataLoaded(result: HomeResult)
}

struct HomePresenterImp {
    private var view: HomeView?
    private var interactor: HomeInteractor?
    
    init(view: HomeView?, interactor: HomeInteractor?) {
        self.view = view
        self.interactor = interactor
    }
    
    func loadData() {
        interactor?.loadData()
//        searchTextField
//            .rx
//            .text
//            .orEmpty
//            .debounce(0.3, scheduler: MainScheduler.instance)
//            .subscribe(onNext: { [unowned self] query in
//                self.displayResults = self.results.filter { $0.name.hasPrefix(query) }
//                self.collectionView.reloadData()
//            })
//            .disposed(by: disposeBag)
    }
    
    func cellWasSelected(indexPath: IndexPath) {
//        if let detailViewController = UIStoryboard(name: "Main",
//                                                   bundle: nil).instantiateViewController(withIdentifier: "detailVC") as? UserDetailViewController {
//            detailViewController.setModel(model: displayResults[indexPath.row])
//            navigationController?.pushViewController(detailViewController, animated: true)
//        }
    }
}

extension HomePresenterImp: HomePresenter {
    func dataLoaded(result: HomeResult) {
        switch result {
        case .success(let results):
            view?.receiveData(results: results)
        case .failure(let error):
            view?.displayError(error: error.localizedDescription)
        }
    }
}
