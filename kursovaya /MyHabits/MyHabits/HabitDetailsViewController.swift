import UIKit

class HabitDetailsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DateTableViewCell.self, forCellReuseIdentifier: String(describing: DateTableViewCell.self))
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .fullScreen
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(editHabitButton))
        navigationItem.largeTitleDisplayMode = .never

        setupLayout()
        tableView.dataSource = self
        
    }
    
    fileprivate func setupLayout() {
        view.addSubview(tableView)
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

extension HabitDetailsViewController: UITableViewDataSource {
    
    /// Количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    /// Количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return HabitsStore.shared.dates.count
        }
    }
    
    /// Секция
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DateTableViewCell.self), for: indexPath) as! DateTableViewCell
        
        cell.date = HabitsStore.shared.dates[indexPath.row]
        
        return cell
    }
    
    @objc func editHabitButton(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let habitVC = storyboard.instantiateViewController(withIdentifier: String("HabitViewController")) as! HabitViewController
        habitVC.removeHabitButton.isHidden = false
        self.present(habitVC, animated: true, completion: nil)
        
    }
 
}
