//
//  PostViewController.swift
//  Navigation
//
//  Created by Alex Chumakov on 20.05.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    // MARK: - Subviews
    
    var post: Post = Post(title: "")
    
    private lazy var myButton = UIBarButtonItem(
        barButtonSystemItem: .add,
        target: self,
        action: #selector(newInfoController(_: )))
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private
    
    private func setupView() {
        view.backgroundColor = .green
        title = post.title
        navigationItem.rightBarButtonItem = myButton
    }
    
    // MARK: - Actions
    
    @objc private func newInfoController(_ sender: UIButton) {
        let infoViewController = InfoViewController()
        
        infoViewController.modalTransitionStyle = .coverVertical
        infoViewController.modalPresentationStyle = .fullScreen
        
        present(infoViewController, animated: true)
    }
}
