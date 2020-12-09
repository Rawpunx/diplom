import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .systemGray6
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProgressHeaderViewCell.self, forCellWithReuseIdentifier: String(describing: ProgressHeaderViewCell.self))
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ProgressCollectionViewCell.self))
        
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Увеличенный загаловок для HabitsViewController
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupLayout()
        
    }
    
    fileprivate func setupLayout() {
        view.addSubview(collectionView)
        
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
}


extension HabitsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else {
            return HabitsStore.shared.habits.count
        }
    }
    // создание ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell: ProgressHeaderViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProgressHeaderViewCell.self), for: indexPath) as! ProgressHeaderViewCell
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 4
            return cell
        }else {
            let cell: ProgressCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProgressCollectionViewCell.self), for: indexPath) as! ProgressCollectionViewCell
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 4
            cell.habit = HabitsStore.shared.habits[indexPath.item]
            return cell
        }
        
    }
    
    
}

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    
    var offset: CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width: CGFloat = (collectionView.bounds.width - offset * 2)
            
            return CGSize(width: width, height: 60)
        }else {
            let width: CGFloat = (collectionView.bounds.width - offset * 2)
            
            return CGSize(width: width, height: 130)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    
    // отступ между строками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return offset
    }
    
    // отступ у секции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets.init(top: 22, left: offset, bottom: 0, right: offset)
        }else {
            return UIEdgeInsets.init(top: 18, left: offset, bottom: 22, right: offset)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section >= 1 {
            performSegue(withIdentifier: "details", sender: nil)
        }
        
  }
}
