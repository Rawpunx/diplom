import UIKit

class InfoViewController: UIViewController {
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textLabel.text = "Привычка за 21 день"
        
        return textLabel
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.showsVerticalScrollIndicator = false
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:\n\n1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.\n\n2. Выдержать 2 дня в прежнем состоянии самоконтроля.\n\n3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться.\n\n4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.\n\n5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.\n\n6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.\n\nИсточник: psychbook.ru"
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        view.addSubview(textLabel)
        view.addSubview(textView)
        
        let constraints = [
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            textView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
}
