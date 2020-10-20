//
//  LoginViewController.swift
//  FireBaseTests
//
//  Created by Аня Голубева on 20.10.2020.
//  Copyright © 2020 Аня Голубева. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let  usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor =  .secondarySystemBackground
        
        
        return field
    }()
    
    private let  passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor =  .secondarySystemBackground

        
        
        return field
    }()
    
    private let  loginButton: UIButton = {
        let button =  UIButton ()
        button.setTitle("Log in", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white , for: .normal)

        return button
    }()
    
    private let  termsButton: UIButton = {
        let button =  UIButton ()
        button.setTitle("Terms and Services", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        
        return button
    }()
    
    private let  privacyButton: UIButton = {
        let button =  UIButton ()
        button.setTitle("Privecy and Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        
        return button
    }()
    
    private let  createAccountView: UIButton = {
        let button =  UIButton ()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New user?  Register here...", for: .normal)
        
        return button
    }()
    
    private let  headerView: UIView = {
        let header =  UIView ()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        
        return header
    }()
    

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameEmailField.delegate = self
        passwordField.delegate = self
        
        addSubviews()
        view.backgroundColor = .systemBackground
        
        headerView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.frame.size.width,
            height: view.hight/3.0
        )
        
        usernameEmailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        
        passwordField.frame = CGRect(
            x: 25,
            y: usernameEmailField.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        createAccountView.frame = CGRect(
            x: 25,
            y: loginButton.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        
    
        configerHeaderView()

        // Do any additional setup after loading the view.
    }
    
    private func configerHeaderView(){
        guard headerView.subviews.count == 1 else {
             return
        }
        
        guard let backgroundView = headerView.subviews.first  else {
            return
        }
        backgroundView.frame = headerView.bounds
        let imageView = UIImageView(image: UIImage(named: "text_inst"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0  , y: view.safeAreaInsets.top, width:headerView.width/2.0 , height: headerView.hight - view.safeAreaInsets.top)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         
    }
    
    
    private func addSubviews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountView )
        view.addSubview(termsButton)
        view.addSubview(headerView)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc private func didTapLoginButton(){}
    @objc private func didTapTermsButton() {}
    @objc private func didTapPrivacyButton() {}
    @objc private func didTapCreateAccountButton(){}
    
}

extension  LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            didTapLoginButton()
        }
         return true
    }
}
