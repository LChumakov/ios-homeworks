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

        view.backgroundColor = .white
        title = "New view"
        
       let infoButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.borderColor = UIColor.red.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 10
            button.setTitle("Touch me", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
           
            return button
        }()
        
        view.addSubview(infoButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            infoButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
            infoButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            infoButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            infoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        infoButton.addTarget(self, action: #selector(showUIAlertController(_:)), for: .touchUpInside)
        
    }
    
    @objc func showUIAlertController (_ sender: UIButton) {
        let alertView = UIAlertController(
            title: "ALERT",
            message: "Are you okay?",
            preferredStyle: .alert)
        
        alertView.addAction(UIAlertAction(title: "Yes", style: .default))
        alertView.addAction(UIAlertAction(title: "No", style: .cancel))
        
        self.present(alertView, animated: true)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


