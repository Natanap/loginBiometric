//
//  ViewController.swift
//  loginBiometric
//
//  Created by Natanael Alves Pereira on 17/04/23.
//

import UIKit

class LoginViewController: UIViewController {

    var loginView: LoginView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView = LoginView()
        self.view = loginView
    }

}

