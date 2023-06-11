//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alex Chumakov on 20.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileHeaderView = ProfileHeaderView()
    
    override func viewWillLayoutSubviews() {
        showHearedView()
    }
    
    private func showHearedView() {
        
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .lightGray
    }

    
    

    
}
