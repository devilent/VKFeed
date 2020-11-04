//
//  ViewController.swift
//  VKFeed
//
//  Created by Илья on 04.11.2020.
//

import UIKit

class AuthViewController: UIViewController {
    
    var authService: AuthService!
    
    let authButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Авторизация", for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(pressAuth), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color.main
        setupViews()
        setupConstraints()
        
        authService = AuthService.shared
    }
    
    @objc private func pressAuth() {
        authService.signIn()
    }
    
    private func setupViews() {
        self.view.addSubview(authButton)
    }
    
    private func setupConstraints() {
        authButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        authButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        authButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        authButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
