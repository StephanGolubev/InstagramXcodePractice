//
//  ViewController.swift
//  FireBaseTests
//
//  Created by Аня Голубева on 16/10/2020.
//  Copyright © 2020 Аня Голубева. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthinticated()
        
    }
    
    private func handleNotAuthinticated() {
        if Auth.auth().currentUser == nil {
             let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen  
            present(loginVC, animated: false)
        }
    }
}

