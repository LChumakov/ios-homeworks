//
//  PostViewController.swift
//  Navigation
//
//  Created by Alex Chumakov on 20.05.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post = Post(title: "")
    
    private lazy var myButton = UIBarButtonItem(
        barButtonSystemItem: .add,
        target: self,
        action: #selector(newInfoController(_: )))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    private func setupView() {
        view.backgroundColor = .green
        title = post.title
        navigationItem.rightBarButtonItem = myButton
    }
    
    @objc private func newInfoController(_ sender: UIButton) {
        let infoViewController = InfoViewController()
        
        infoViewController.modalTransitionStyle = .coverVertical
        infoViewController.modalPresentationStyle = .fullScreen
        
        present(infoViewController, animated: true)
    }
}

