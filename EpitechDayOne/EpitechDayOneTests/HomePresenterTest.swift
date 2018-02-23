//
//  HomePresenterTest.swift
//  EpitechDayOneTests
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import XCTest
@testable import EpitechDayOne

class HomePresenterTest: XCTestCase {
    
    class MockHomeInteractor: HomeInteractor {
        var loadDataWasCalled = false
        func loadData() {
            loadDataWasCalled = true
        }
        var userAtIndexWasCalled = false
        func getUserAtIndexPath(indexPath: IndexPath) -> UserModel? {
            userAtIndexWasCalled = true
            return UserModel(name: "Fred")
        }
        
        func getFilteredResults(searchText: String) -> [UserModel]? {
            return [UserModel(name: "Fred"), UserModel(name: "Simon")]
        }
    }
    
    class MockHomeRouter: HomeRouter {
        var cellWasCalled = false
        func cellWasSelected(user: UserModel) {
            cellWasCalled = true
        }
    }
    
    class MockView: HomeView {
        var displayResultsWasCalled = false
        var errorWasCalled = false
        func receiveData(results: [UserModel]) {
            displayResultsWasCalled = true
        }
        
        func displayError(error: String) {
            errorWasCalled = true
        }
        
        var searchTextField: UITextField? {
            return nil
        }
    }
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadDataIsCalled() {
        let presenter = HomePresenterImp(view: nil, router: nil)
        let mockInteractor = MockHomeInteractor()
        presenter.setInteractor(interactor: mockInteractor)
        presenter.loadData()
        XCTAssertTrue(mockInteractor.loadDataWasCalled)
    }
    
    func testCellWasSelected() {
        let mockInteractor = MockHomeInteractor()
        let mockRouter = MockHomeRouter()
        let presenter = HomePresenterImp(view: nil, router: mockRouter)
        presenter.setInteractor(interactor: mockInteractor)
        presenter.cellWasSelected(indexPath: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockInteractor.userAtIndexWasCalled)
        XCTAssertTrue(mockRouter.cellWasCalled)
    }
    
    func testReceivedData() {
        let mockView = MockView()
        let presenter = HomePresenterImp(view: mockView, router: nil)
        presenter.dataLoaded(result: HomeResult.failure(ErrorAuth.emailIsInvalid))
        XCTAssertTrue(mockView.errorWasCalled)
        presenter.dataLoaded(result: HomeResult.success([UserModel]()))
        XCTAssertTrue(mockView.displayResultsWasCalled)
    }
    
}
