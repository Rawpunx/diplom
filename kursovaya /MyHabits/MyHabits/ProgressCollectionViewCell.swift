import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    var habit: Habit? {
        didSet {
            nameLabel.text = habit?.name
            nameLabel.textColor = habit?.color
            dateLabel.text = habit?.dateString
            countLabel.text = "Подряд \(countDays)"
            statusCircle.layer.borderColor = habit?.color.cgColor
            
        }
    }
    
    var countDays = 0
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        nameLabel.numberOfLines = 2
        
        return nameLabel
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        return dateLabel
    }()
    
    private lazy var countLabel: UILabel = {
        let countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        return countLabel
    }()
    
    private lazy var statusCircle: UIButton = {
        let statusCircle = UIButton()
        statusCircle.translatesAutoresizingMaskIntoConstraints = false
        statusCircle.layer.cornerRadius = 18
        statusCircle.layer.borderWidth = 2
        statusCircle.addTarget(self, action: #selector(setBackgroundImageButton), for: .touchUpInside)
        
        
        return statusCircle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    @objc fileprivate func setBackgroundImageButton() {
        statusCircle.backgroundColor = habit?.color
        
    
        if statusCircle.backgroundColor != .white {
            countDays += 1
        }
        countLabel.text = "Подряд \(countDays)"
        
        HabitsStore.shared.track(habit!)
    }
    
    
    
    fileprivate func setupLayout() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(countLabel)
        contentView.addSubview(statusCircle)
        
        
        let constraints = [
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            countLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            countLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            statusCircle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 47),
            statusCircle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            statusCircle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -47),
            statusCircle.widthAnchor.constraint(equalToConstant: 36),
            statusCircle.heightAnchor.constraint(equalToConstant: 36)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}
