//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alex Chumakov on 28.05.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var imageProfile: UIImageView = {
        var imageView = UIImageView()
        let image = UIImage(named: "Profile")
        imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 50
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        
        return imageView
    }()
    
    private var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Фрилансер"
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    private var labelStatus: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting ..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var showStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status...", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(printStatus), for: .touchUpInside)
        button.backgroundColor = .blue
        
        return button
    }()
    
    private lazy var textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 12
        text.placeholder = "New status"
        text.leftViewMode = .always
        text.addTarget(self, action: #selector(statusTextChange), for: .editingChanged)
        
        return text
    }()
    
    private var statusText: String = ""
    
    @objc private func printStatus () {
        labelStatus.text = statusText
        print ("Статус: \(labelStatus.text ?? "")")
    }
    
    @objc private func statusTextChange(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    private func setupConstraints() {
        addSubview(imageProfile)
        addSubview(labelName)
        addSubview(showStatusButton)
        addSubview(labelStatus)
        addSubview(textField)
    
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            imageProfile.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageProfile.widthAnchor.constraint(equalToConstant: 100),
            imageProfile.heightAnchor.constraint(equalToConstant: 100),

            labelName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            labelName.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
            labelName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16 ),

            labelStatus.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -10),
            labelStatus.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
            labelStatus.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            showStatusButton.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
    
            textField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textField.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
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
