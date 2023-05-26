//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alex Chumakov on 20.05.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var actionButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(actionButton)
        self.title = "Profile"
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            actionButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
        @objc func buttonPressed (_ sender: UIButton) {
        let postViewController = PostViewController()
        postViewController.post = Post(title: "Change title")
        
        postViewController.modalTransitionStyle = .coverVertical
        postViewController.modalPresentationStyle = .fullScreen
       
        navigationController?.pushViewController(postViewController, animated: true)
    }

}
    struct Post {
        var title: String
}



