import UIKit

class ProgressHeaderViewCell: UICollectionViewCell {
    
    var progress: HabitsStore? {
        didSet {
            progressView.progressTintColor = .init(displayP3Red: 161, green: 22, blue: 204, alpha: 1)
            progressView.setProgress(HabitsStore.shared.todayProgress, animated: true)
            
        }
    }
    
    private lazy var motivationLabel: UILabel = {
        let motivationLabel = UILabel()
        motivationLabel.translatesAutoresizingMaskIntoConstraints = false
        motivationLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        motivationLabel.text = "Все получится!"
        motivationLabel.textColor = .gray
        
        return motivationLabel
    }()
    
    private lazy var progressLabel: UILabel = {
        let progressLabel = UILabel()
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        //progressLabel.text = "50%"
        progressLabel.textColor = .gray
        
        return progressLabel
    }()
    
    private lazy var progressView: UIProgressView = {
       let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        return progressView
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    fileprivate func setupLayout() {

        contentView.addSubview(motivationLabel)
        contentView.addSubview(progressLabel)
        contentView.addSubview(progressView)
        
        
        let constraints = [
            motivationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            motivationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            //motivationLabel.widthAnchor.constraint(equalTo: motivationLabel.widthAnchor),
            
            progressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            //progressLabel.widthAnchor.constraint(equalTo: progressLabel.widthAnchor),
            
            progressView.topAnchor.constraint(equalTo: motivationLabel.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            //progressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            progressView.heightAnchor.constraint(equalToConstant: 7)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}
