//
//  LoginViewController.swift
//  FireBaseTests
//
//  Created by Аня Голубева on 20.10.2020.
//  Copyright © 2020 Аня Голубева. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let  usernameFiled: UITextField = {
        let field = UITextField()
        field.placeholder = "Username"
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
    
    private let  useremailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
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
        button.setTitle("Register", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white , for: .normal)

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
        usernameFiled.delegate = self
        useremailField.delegate = self
        passwordField.delegate = self
        
        addSubviews()
        view.backgroundColor = .systemBackground
        
        headerView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.frame.size.width,
            height: view.hight/3.0
        )
        
        usernameFiled.frame = CGRect(
            x: 25,
            y: headerView.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        useremailField.frame = CGRect(
            x: 25,
            y: usernameFiled.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        
        
        passwordField.frame = CGRect(
            x: 25,
            y: useremailField.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width - 50,
            height: 52
        )

        
    
        configerHeaderView()

        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)


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
        view.addSubview(usernameFiled)
        view.addSubview(useremailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
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
    @objc private func didTapLoginButton(){
        passwordField.resignFirstResponder()
        usernameFiled.resignFirstResponder()
        useremailField.resignFirstResponder()
        
        guard let usernameEmail = usernameFiled.text, !usernameEmail.isEmpty,let userPassword = passwordField.text, !userPassword.isEmpty, userPassword.count >= 8 else{
            return
        }
        
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"),usernameEmail.contains(".") {
            email = usernameEmail
        }
        else{
            username = usernameEmail
        }
        
        AuthManager.shared.loginUser(username: username, email: email, password: userPassword) {success in
            
            DispatchQueue.main.async {
                if success{
                    self.dismiss(animated: true, completion: nil)
                }
                else{
                    let alters = UIAlertController(title: "Error", message: "You were not able to login", preferredStyle: .alert)
                    alters.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alters, animated: true)
                }
                
            }
            
            
        }
        
}
    @objc private func didTapCreateAccountButton(){
        let vc = RegisterViewController()
        present(vc, animated: true)
    }
    
}

extension  RegisterViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameFiled{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            didTapLoginButton()
        }
         return true
    }
}
