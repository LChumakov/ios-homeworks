
import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Data
    
    fileprivate let data = PostModel.make()
    
    // MARK: - Subviews
    
    private let profileHeaderView = ProfileHeaderView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubview()
        tuneTableView()
        setupConstraint()
    }
    // MARK: - Private
    
    private func setupView() {
        title = "Профиль"
        view.backgroundColor = .systemGray4
    }
    
    private func addSubview() {
        view.addSubview(profileHeaderView)
        view.addSubview(tableView)
    }
    
    private func tuneTableView() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
//        tableView.delegate = self
    }
    
    private func setupConstraint() {
        let safeAreaGuiade = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(equalTo: safeAreaGuiade.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeAreaGuiade.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeAreaGuiade.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuiade.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuiade.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuiade.bottomAnchor)
        ])
    }
  
    // MARK: - Actions
    
}

extension ProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell
        else { return UITableViewCell() }
        let post = data[indexPath.row]
//        cell.configure(with: post)
        return cell


    }
}
