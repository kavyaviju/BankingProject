//
//  ViewController.swift
//  BankingProject
//
//  Created by MacBook Air on 23/12/22.
//

import UIKit

protocol loginViewControllerDelegate : AnyObject {
    func didlogin()
}


class loginViewController: UIViewController {
    
    let LoginView = loginView()
    let titlelabel = UILabel()
    let subtitlelabel = UILabel()
    //this is a system style button
    let signinbutton = UIButton(type: .system)
    let errorlabel = UILabel()
    
    weak var delegate : loginViewControllerDelegate?
    
   
    //using computed properties to return the username and password from the loginview file
    var username : String? {
        return LoginView.usernametxtfield.text
    }
    var password : String? {
        return LoginView.passwordfield.text
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            style()
            layout()
        }
    }

    extension loginViewController {
         func style() {
            LoginView.translatesAutoresizingMaskIntoConstraints = false
            
            
            //style for the sing in button
            signinbutton.translatesAutoresizingMaskIntoConstraints = false
            //configuration whether the button is gray, filled, bordered
            signinbutton.configuration = .filled()
            signinbutton.configuration?.imagePadding = 8
            //title text for the button
            signinbutton.setTitle("SIGN IN", for: [])
            signinbutton.addTarget(self, action: #selector(signintapped), for: .primaryActionTriggered)
            
            //error label
            errorlabel.translatesAutoresizingMaskIntoConstraints = false
            errorlabel.textAlignment = .center
            errorlabel.textColor = .red
            //giving zero to the number of lines makes the text multi line
            errorlabel.numberOfLines = 0
            //the label text will be hidden, will be shown if asked to display
            errorlabel.isHidden = true
            
            //title label
            titlelabel.translatesAutoresizingMaskIntoConstraints = false
            titlelabel.numberOfLines = 0
            titlelabel.textAlignment = .center
            titlelabel.font = .boldSystemFont(ofSize: 24)
            titlelabel.textColor = .white
            titlelabel.text = "Bankey"
            
            //header label
            subtitlelabel.translatesAutoresizingMaskIntoConstraints = false
            subtitlelabel.textAlignment = .center
            subtitlelabel.textColor = .white
            subtitlelabel.numberOfLines = 0
            subtitlelabel.text = "Your premium source for all things banking"
            
        }
        
         func layout() {
            view.addSubview(titlelabel)
            view.addSubview(subtitlelabel)
            view.addSubview(LoginView)
            view.addSubview(signinbutton)
            view.addSubview(errorlabel)
            //constraints for the login view
            NSLayoutConstraint.activate([
                LoginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                LoginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                view.trailingAnchor.constraint(equalToSystemSpacingAfter: LoginView.trailingAnchor, multiplier: 1)
            ])
            //constraints for the sign in button
            NSLayoutConstraint.activate([
                signinbutton.topAnchor.constraint(equalToSystemSpacingBelow: LoginView.bottomAnchor, multiplier: 2),
                //equal to can be used when no multiplier is required
            signinbutton.trailingAnchor.constraint(equalTo: LoginView.trailingAnchor),
                                        
            signinbutton.leadingAnchor.constraint(equalTo: LoginView.leadingAnchor)])
            
            //constraints for the error label
            NSLayoutConstraint.activate([
                errorlabel.topAnchor.constraint(equalToSystemSpacingBelow: signinbutton.bottomAnchor, multiplier: 2),
                errorlabel.trailingAnchor.constraint(equalTo: signinbutton.trailingAnchor),
                                            
                errorlabel.leadingAnchor.constraint(equalTo: signinbutton.leadingAnchor)])
              
            NSLayoutConstraint.activate([
                subtitlelabel.topAnchor.constraint(equalToSystemSpacingBelow: titlelabel.bottomAnchor, multiplier: 3),
                titlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
            
            NSLayoutConstraint.activate([
                LoginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitlelabel.bottomAnchor, multiplier: 3),
                subtitlelabel.leadingAnchor.constraint(equalTo: LoginView.leadingAnchor),
                        subtitlelabel.trailingAnchor.constraint(equalTo:
                                                                    LoginView.trailingAnchor)])
         
        }
    }

extension loginViewController  {
    
    
    @objc func signintapped (){
        errorlabel.isHidden = true
        login()
    }
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("username/password should never be nil")
            return
            
        }
        if username.isEmpty || password.isEmpty {
            configureview(withmessage: "username/password shouldnt be blank")
            return
        }
        if username == "Abc" && password == "123" {
            signinbutton.configuration?.showsActivityIndicator = true
            delegate?.didlogin()
        }
        else {
            configureview(withmessage: "incorrect username/password")
            signinbutton.configuration?.showsActivityIndicator = false
        }
        func configureview(withmessage message : String) {
            errorlabel.isHidden = false
            errorlabel.text = message
        }
    }
    
}
    
