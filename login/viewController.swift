//
//  loginSuccesful.swift
//  BankingProject
//
//  Created by MacBook Air on 23/12/22.
//

import Foundation
import UIKit

class viewController : UIViewController {
    let successLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
}

extension viewController {
    func style() {
        view.backgroundColor = .systemPink
        //successlabel
        successLabel.translatesAutoresizingMaskIntoConstraints = false
        successLabel.font = .boldSystemFont(ofSize: 22)
        successLabel.textAlignment = .center
        successLabel.textColor = .black
        successLabel.text = "login was successful"
    }
    
    func layout() {
        view.addSubview(successLabel)
        
        NSLayoutConstraint.activate([
           view.centerYAnchor.constraint(equalToSystemSpacingBelow: successLabel.centerYAnchor, multiplier: 1),
            view.leadingAnchor.constraint(equalToSystemSpacingAfter: successLabel.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: successLabel.trailingAnchor, multiplier: 1)
        ])
    }
}
