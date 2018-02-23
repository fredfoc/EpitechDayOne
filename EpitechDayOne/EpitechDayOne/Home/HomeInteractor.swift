//
//  HomeInteractor.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import Foundation
import Alamofire

enum HomeResult {
    case success([UserModel])
    case failure(Error)
}

protocol HomeInteractor {
    func loadData()
    func getUserAtIndexPath(indexPath: IndexPath) -> UserModel?
    func getFilteredResults(searchText: String) -> [UserModel]?
}

struct HomeInteractorImp {
    private var presenter: HomePresenter?
    private var resultsManager: ResultsManager?
    init(presenter: HomePresenter?, resultsManager: ResultsManager?) {
        self.presenter = presenter
        self.resultsManager = resultsManager
    }
}

extension HomeInteractorImp: HomeInteractor {
    
    func getUserAtIndexPath(indexPath: IndexPath) -> UserModel? {
        guard indexPath.row < resultsManager?.results.count ?? 0 else {
            return nil
        }
        return resultsManager?.results[indexPath.row]
    }
    
    func setResults(results: [UserModel]) {
        resultsManager?.results = results
    }
    
    func loadData() {
        Alamofire
            .request("https://api.randomuser.me/?nat=US&results=15")
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    if let value = value as? [String: Any], let resultsJson = value["results"] as? [Any] {
                        let results = resultsJson.map({ (data) -> UserModel in
                            if let data = data as? [String: Any], let name = data["name"] as? [String: Any]
                            {
                                return UserModel(name: name["last"] as! String)
                            }
                            return UserModel(name: "No Name")
                        })
                        self.presenter?.dataLoaded(result: HomeResult.success(results))
                        self.setResults(results: results)
                    }
                case .failure(let error):
                    self.presenter?.dataLoaded(result: HomeResult.failure(error))
                }
        }
    }
    
    func getFilteredResults(searchText: String) -> [UserModel]? {
        return resultsManager?.results.filter { $0.name.hasPrefix(searchText) }
    }
}
