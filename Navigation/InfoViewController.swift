//
//  InfoViewController.swift
//  Navigation
//
//  Created by Alex Chumakov on 24.05.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
    }
    
   private lazy var infoButton: UIButton = {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.layer.borderColor = UIColor.red.cgColor
         button.layer.borderWidth = 1
         button.layer.cornerRadius = 10
         button.setTitle("Touch me", for: .normal)
         button.setTitleColor(.systemBlue, for: .normal)
         button.addTarget(self, action: #selector(showUIAlertController), for: .touchUpInside)
         return button
     }()
     
    private func setupConstraints() {
        view.addSubview(infoButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            infoButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
            infoButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            infoButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            infoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "New view"
    }
    
    @objc private func showUIAlertController () {
        let alertView = UIAlertController(
            title: "ALERT",
            message: "Are you okay?",
            preferredStyle: .alert)
        
        let printYes = UIAlertAction(title: "Yes", style: .default) { (action) in
            print("Yesssssss")
        }
        let printNo = UIAlertAction(title: "No", style: .cancel)
        alertView.addAction(printYes)
        alertView.addAction(printNo)
        present(alertView, animated: true)
    }
}

