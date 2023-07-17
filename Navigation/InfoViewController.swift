
import UIKit

class InfoViewController: UIViewController {
    
    // MARK: - Subviews
    
   private lazy var infoButton: UIButton = {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.layer.borderColor = UIColor.red.cgColor
         button.layer.borderWidth = 1
         button.layer.cornerRadius = 10
         button.setTitle("Нажми меня", for: .normal)
         button.setTitleColor(.systemBlue, for: .normal)
         button.addTarget(self, action: #selector(showUIAlertController), for: .touchUpInside)
         return button
     }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
    }
    
    // MARK: - Private
     
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
        title = "Новый элемент"
    }
    
    // MARK: - Actions
    
    @objc private func showUIAlertController () {
        let alertView = UIAlertController(
            title: "Предупреждение",
            message: "С тобой все в порядке?",
            preferredStyle: .alert)
        
        let printYes = UIAlertAction(title: "Да", style: .default) { (action) in
            print("Да")
        }
        let printNo = UIAlertAction(title: "Нет", style: .cancel)
        alertView.addAction(printYes)
        alertView.addAction(printNo)
        present(alertView, animated: true)
    }
}

