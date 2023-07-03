
import UIKit

class loginViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
        
    }()
    
    private var imageViewProfile: UIImageView = {
        
        var imageView = UIImageView()
        let image = UIImage(named: "Logo")
        imageView = UIImageView(image: image)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var emailTextView: UITextField = {
        var text = UITextField()
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        text.placeholder = "Email of phone"
        text.font = UIFont.systemFont(ofSize: 16)
        text.layer.backgroundColor = UIColor.systemGray6.cgColor
        text.textColor = .black
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.default
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        text.autocapitalizationType = .none
        text.isSecureTextEntry = true
        
        return text
    }()
    
    private lazy var passwordTextView: UITextField = {
        var text = UITextField()
        
        text.translatesAutoresizingMaskIntoConstraints = false
        
        text.placeholder = "Password"
        text.font = UIFont.systemFont(ofSize: 16)
        text.layer.backgroundColor = UIColor.systemGray6.cgColor
        text.textColor = .black
        text.borderStyle = UITextField.BorderStyle.roundedRect
        text.autocorrectionType = UITextAutocorrectionType.no
        text.keyboardType = UIKeyboardType.default
        text.returnKeyType = UIReturnKeyType.done
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        text.autocapitalizationType = .none
        text.isSecureTextEntry = true
        
        return text
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.clipsToBounds = true
        
        stackView.addArrangedSubview(emailTextView)
        stackView.addArrangedSubview(passwordTextView)
        
        return stackView
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.setBackgroundImage(UIImage(named: "BluePixel"), for: .normal)
        button.clipsToBounds = true
        
        return button
    }()
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(imageViewProfile)
        //        view.addSubview(textStackView)
        view.addSubview(loginButton)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func addSubView() {
        
        view.addSubview(textStackView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
    }
    
    private func setupConstraint() {
        let safeAreaLayout = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 16),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayout.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            //            contentView.widthAnchor.constraint(equalToConstant: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            imageViewProfile.topAnchor.constraint(equalTo: safeAreaLayout.topAnchor, constant: 120),
            imageViewProfile.heightAnchor.constraint(equalToConstant: 100),
            imageViewProfile.widthAnchor.constraint(equalToConstant: 100),
            imageViewProfile.centerXAnchor.constraint(equalTo:safeAreaLayout.centerXAnchor),
            
            textStackView.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            textStackView.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            textStackView.topAnchor.constraint(equalTo: imageViewProfile.bottomAnchor, constant: 120),
            textStackView.heightAnchor.constraint(equalToConstant: 100),
            
            loginButton.leadingAnchor.constraint(equalTo: safeAreaLayout.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayout.trailingAnchor, constant: -16),
            loginButton.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func setupKeyboardObserver() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func willShowKeyboard (_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo? [UIResponder.keyboardFrameEndUserInfoKey] as?
                              NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    @objc func willHideKeyboard (_ notification: NSNotification) {
        scrollView.contentInset.bottom = 0.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        setupView()
        addSubView()
        setupConstraint()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObserver()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObserver()
        
    }
}
