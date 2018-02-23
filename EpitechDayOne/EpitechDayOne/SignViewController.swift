//
//  SignViewController.swift
//  EpitechDayOne
//
//  Created by fauquette fred on 23/02/18.
//  Copyright © 2018 Fred Fauquette. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignViewController: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgView.layer.cornerRadius = 10
    }
    
    
    @IBAction func createUser(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email,
                                   password: password,
                                   completion: {[weak self] (user, error) in
                                    if let _ = user {
                                        self?.navigationController?.popViewController(animated: true)
                                    }
                                    if let error = error {
                                        print(error)
                                    }
            })
        }
        
    }
}
