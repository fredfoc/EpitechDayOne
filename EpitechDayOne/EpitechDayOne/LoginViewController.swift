//
//  ViewController.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 22/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var authImp: EpitechAuth?
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgView.layer.cornerRadius = 10
        title = "Login"
    }

    @IBAction func signInUser(_ sender: Any) {
        authImp?.signInUser(email: emailTextField.text,
                            password: passwordTextField.text,
                            completion: {[weak self] (result) in
                                switch result {
                                case .success :
                                    if let homeVC = UIStoryboard(name: "Main",
                                                                 bundle: nil).instantiateViewController(withIdentifier: "homeVC") as? HomeViewController {
                                        let router = HomeRouterImp(view: homeVC)
                                        var presenter = HomePresenterImp(view: homeVC, router: router)
                                        let interactor = HomeInteractorImp(presenter: presenter, resultsManager: ResultsManagerImp.sharedInstance)
                                        presenter.setInteractor(interactor: interactor)
                                        homeVC.presenter = presenter
                                        self?.navigationController?.pushViewController(homeVC, animated: true)
                                    }
                                    
                                case .failure(let error):
                                    print(error)
                                }
        })
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

