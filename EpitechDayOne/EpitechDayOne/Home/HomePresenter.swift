//
//  HomePresenter.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


protocol HomePresenter {
    func dataLoaded(result: HomeResult)
}

struct HomePresenterImp {
    private var view: HomeView?
    private var interactor: HomeInteractor?
    private var router: HomeRouter?
    private let disposeBag = DisposeBag()
    
    mutating func setInteractor(interactor: HomeInteractor?) {
        self.interactor = interactor
    }
    
    init(view: HomeView?, router: HomeRouter?) {
        self.view = view
        self.router = router
        view?.searchTextField?.rx
            .text
            .orEmpty
            .debounce(0.3, scheduler: MainScheduler.instance)
            .subscribe(onNext: { query in
//                self.view?.receiveData(results: self.interactor?.getFilteredResults(searchText: query) ?? [UserModel]())
            })
            .disposed(by: disposeBag)
    }
    
    func loadData() {
        interactor?.loadData()
    }
    
    func cellWasSelected(indexPath: IndexPath) {
        if let user = interactor?.getUserAtIndexPath(indexPath: indexPath) {
            router?.cellWasSelected(user: user)
        }
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
