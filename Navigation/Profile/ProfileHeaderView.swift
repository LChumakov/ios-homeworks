//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alex Chumakov on 28.05.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var imageProfile: UIImageView {
        let image = UIImage(named: "profile")
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 50
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        
        return imageView
    }
    
    private var labelName: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Фрилансер"
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.textColor = .black
        
        return label
    }
    
    private var labelStatus: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        
        return label
    }
    
    private var showStatusButton: UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status...", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        
        button.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
        
        return button
    }
    
    @objc func printStatus ( _ sender: UIButton) {
        print ("Статус: \(labelStatus.text ?? "")")
    }
    
    private func setupConstraints() {
        addSubview(imageProfile)
        addSubview(labelName)
        addSubview(showStatusButton)
        addSubview(labelStatus)
    
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageProfile.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageProfile.widthAnchor.constraint(equalToConstant: 100),
            imageProfile.heightAnchor.constraint(equalToConstant: 100),

            labelName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            labelName.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16 ),

            labelStatus.topAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: 34),
            labelStatus.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelStatus.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            showStatusButton.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)


        ])
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
     setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
    }
}
