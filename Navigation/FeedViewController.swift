//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alex Chumakov on 20.05.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private lazy var button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Кнопка1", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Кнопка2", for: .normal)
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        
    }
    
    private func setupView() {
       
        self.title = "Лента"
        view.addSubview(stackView)
    }
    
   private func setupConstraints() {
       
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
       
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    @objc private func buttonPressed () {
        let postViewController = PostViewController()
        postViewController.post = Post(title: "Изменение заголовка")

        postViewController.modalTransitionStyle = .coverVertical
        postViewController.modalPresentationStyle = .fullScreen

        navigationController?.pushViewController(postViewController, animated: true)
        
    }
}

    struct Post {
        var title: String
}


