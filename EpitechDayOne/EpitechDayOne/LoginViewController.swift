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
        if let email = emailTextField.text, let password = passwordTextField.text {
            authImp?.signInUser(email: email,
                                        password: password,
                                        completion: {[weak self] (result) in
                                            switch result {
                                            case .success :
                                                let homeVC = UIStoryboard(name: "Main",
                                                                                        bundle: nil).instantiateViewController(withIdentifier: "homeVC")
                                                self?.navigationController?.pushViewController(homeVC, animated: true)
                                            case .failure(let error):
                                                print(error)
                                            }
            })
        }
        
    }
}

