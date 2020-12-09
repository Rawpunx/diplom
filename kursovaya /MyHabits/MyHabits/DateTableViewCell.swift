import UIKit

class DateTableViewCell: UITableViewCell {
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    var date: Date? {
        didSet {
            for i in HabitsStore.shared.dates {
            //dateLabel.text = dateFormatter.string(from: HabitsStore.shared.dates)
            }
        }
    }
    
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return dateLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Layout
private extension DateTableViewCell {
    func setupLayout() {
        contentView.addSubview(dateLabel)
        
        let constraints = [
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
}
