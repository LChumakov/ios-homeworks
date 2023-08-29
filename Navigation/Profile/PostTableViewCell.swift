
import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    
    static let id = "PostTableViewCell"
    
    private let autorPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private let imagePost: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        return image
    }()
    
    private let likesPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let viewsPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        addSubview()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("lol")
    }
    
    // MARK: - Private
    
    private func setupUI() {}
    
    private func addSubview() {
        contentView.addSubview(autorPost)
        contentView.addSubview(descriptionPost)
        contentView.addSubview(imagePost)
        contentView.addSubview(likesPost)
        contentView.addSubview(viewsPost)
    }
    
    func configure(post: PostModel) {
        autorPost.text = post.autors
        descriptionPost.text = post.description
        imagePost.image = UIImage(named: post.image)
        likesPost.text = "Лайки: \(String(post.likes))"
        viewsPost.text = "Просмотры: \(String(post.views))"
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            autorPost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            autorPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            autorPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            imagePost.topAnchor.constraint(equalTo: autorPost.bottomAnchor, constant: 16),
            imagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imagePost.heightAnchor.constraint(equalTo: imagePost.widthAnchor),
            
            descriptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 16),
            descriptionPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 16),
            likesPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            likesPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            viewsPost.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: 16),
            viewsPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            viewsPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
