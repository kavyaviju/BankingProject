//
//  loginView.swift
//  BankingProject
//
//  Created by MacBook Air on 23/12/22.
//

import Foundation
import UIKit

class loginView : UIView {
    let usernametxtfield = UITextField()
    let passwordfield = UITextField()
    let stackview = UIStackView()
    let dividerview = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension loginView {
    
func style() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .secondarySystemBackground
    
    //username text field
    usernametxtfield.translatesAutoresizingMaskIntoConstraints = false
    usernametxtfield.placeholder = "enter the username"
    usernametxtfield.delegate = self
    
    //password field
    passwordfield.translatesAutoresizingMaskIntoConstraints = false
    passwordfield.placeholder = "enter the password"
    passwordfield.isSecureTextEntry = true
    passwordfield.delegate = self
    
    //stack view
    stackview.translatesAutoresizingMaskIntoConstraints = false
    stackview.axis = .vertical
    stackview.spacing = 8
    
    //divider view
    dividerview.translatesAutoresizingMaskIntoConstraints = false
    dividerview.backgroundColor = .secondarySystemFill
    
    layer.cornerRadius = 5
    clipsToBounds = true
    
}


func layout() {
    
    //adding the stack view to the sub view
    addSubview(stackview)
    //add the elements which go inside the stack view
    stackview.addArrangedSubview(usernametxtfield)
    stackview.addArrangedSubview(dividerview)
    stackview.addArrangedSubview(passwordfield)
    
    
    //constraints for username
    NSLayoutConstraint.activate([
        stackview.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),bottomAnchor.constraint(equalToSystemSpacingBelow: stackview.bottomAnchor, multiplier: 1),stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 1)])
    //constraints for the divider view , only height constraint is required
    NSLayoutConstraint.activate([
        dividerview.heightAnchor.constraint(equalToConstant: 1)])
    
    
}
}

extension loginView : UITextFieldDelegate {
    //asks delegate whether to process the pressing of the return button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    //The text field for which editing ended.
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        usernametxtfield.endEditing(true)
        passwordfield.endEditing(true)
    }
    
}
