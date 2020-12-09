import UIKit
import Combine

class HabitViewController: UIViewController {
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.text = "название"
        
        return nameLabel
    }()
    
    private lazy var habitTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Бегать по утрам, спать 8 часв и т.п."
        
        return textField
    }()
    
    private lazy var colorLabel: UILabel = {
        let colorLabel = UILabel()
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        colorLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        colorLabel.text = "цвет"
        
        return colorLabel
    }()
    
    private lazy var colorPickerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 15
        button.addTarget(self, action: Selector(("openColorPicker")), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        timeLabel.text = "время"
        
        return timeLabel
    }()
    
    private lazy var setTimeLabel: UILabel = {
        let setTimeLabel = UILabel()
        setTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        setTimeLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        setTimeLabel.text = "Каждый день в"
        
        return setTimeLabel
    }()
    
    private lazy var timeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "11:00 PM"
        
        return textField
    }()
    
    private lazy var timePicker: UIDatePicker = {
        let timePicker = UIDatePicker()
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.addTarget(self, action: #selector(setTime(sender:)), for: .valueChanged)
        
        return timePicker
    }()
    
    open lazy var removeHabitButton: UIButton = {
        let removeButton = UIButton()
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.setTitle("Удалить привычку", for: .normal)
        removeButton.setTitleColor(.red, for: .normal)
        removeButton.isHidden = true
        
        return removeButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        self.navigationItem.title = "Создать"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelHabitBarButton(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveHabitBarButton(_:)))
     
        
        if removeHabitButton.isHidden == false {
            self.navigationController?.isNavigationBarHidden = false
            self.navigationItem.largeTitleDisplayMode = .never
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            self.navigationItem.title = "Править"
      
            
        }
        
        setupLayout()
        
    }
    
    @objc private func openColorPicker() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        self.present(colorPicker, animated: true, completion: nil)
    }
    
    @objc private func setTime(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH : mm"
        timeTextField.text = dateFormatter.string(from: sender.date)
    }
    
    fileprivate func setupLayout() {
        view.addSubview(nameLabel)
        view.addSubview(habitTextField)
        view.addSubview(colorLabel)
        view.addSubview(colorPickerButton)
        view.addSubview(timeLabel)
        view.addSubview(setTimeLabel)
        view.addSubview(timeTextField)
        view.addSubview(timePicker)
        view.addSubview(removeHabitButton)
        
        let constraints = [
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            habitTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            habitTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            habitTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            colorLabel.topAnchor.constraint(equalTo: habitTextField.bottomAnchor, constant: 15),
            colorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            colorPickerButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 7),
            colorPickerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colorPickerButton.heightAnchor.constraint(equalToConstant: 30),
            colorPickerButton.widthAnchor.constraint(equalToConstant: 30),
            
            timeLabel.topAnchor.constraint(equalTo: colorPickerButton.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            setTimeLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            setTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            setTimeLabel.widthAnchor.constraint(equalTo: setTimeLabel.widthAnchor),
            
            timeTextField.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            timeTextField.leadingAnchor.constraint(equalTo: setTimeLabel.trailingAnchor, constant: 6),
            
            timePicker.topAnchor.constraint(equalTo: setTimeLabel.bottomAnchor, constant: 15),
            timePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            removeHabitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            removeHabitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            removeHabitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func saveHabitBarButton(_ sender: UIBarButtonItem) {
        let newHabit = Habit(name: habitTextField.text ?? "", date: timePicker.date, color: colorPickerButton.backgroundColor ?? .systemOrange)
        
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelHabitBarButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension HabitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        colorPickerButton.backgroundColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorPickerButton.backgroundColor = viewController.selectedColor
    }
}


