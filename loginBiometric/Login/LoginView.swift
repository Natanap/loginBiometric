//
//  LoginView.swift
//  loginBiometric
//
//  Created by Natanael Alves Pereira on 17/04/23.
//

import UIKit
import CoreData

class LoginView: UIView {

    var date: [NSManagedObject] = []
    
    lazy var userTF: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.borderStyle = .roundedRect
        text.placeholder = "Digite seu UserName"
        text.textColor = .darkGray
        text.clipsToBounds = true
        text.layer.cornerRadius = 2
        return text
    }()
    
    lazy var passwordTF: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.borderStyle = .roundedRect
        text.placeholder = "Digite sua senha"
        text.textColor = .darkGray
        text.clipsToBounds = true
        text.layer.cornerRadius = 2
        return text
    }()
    
    lazy var _switch: UISwitch = {
        let switchT = UISwitch()
        switchT.translatesAutoresizingMaskIntoConstraints = false
        switchT.onTintColor = .red
        switchT.offTintColor(color: .blue)
        switchT.isOn = false
        switchT.addTarget(self, action: #selector(onSwitchValueChanged), for: .valueChanged)
        
        return switchT
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray
        self.toAddSubViews()
        self.setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func toAddSubViews() {
        self.addSubview(userTF)
        self.addSubview(passwordTF)
        self.addSubview(_switch)
    }
    
    
    @objc func onSwitchValueChanged(_ _switch: UISwitch) {
        if _switch.isOn {
            let name = userTF.text ?? ""
            let password = passwordTF.text ?? ""
            let state = true

            save(name: name, password: password, state: state)
            
        } else {
            userTF.text = ""
            passwordTF.text = ""
            let state = false
        }
    }
    
    private func save(name: String, password: String, state: Bool) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = persistentContainer.viewContext
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            userTF.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            userTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            userTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            userTF.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTF.topAnchor.constraint(equalTo: userTF.bottomAnchor, constant: 20),
            passwordTF.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            passwordTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            passwordTF.heightAnchor.constraint(equalToConstant: 50),
            
            _switch.topAnchor.constraint(equalTo: self.passwordTF.bottomAnchor, constant: 10),
            _switch.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            _switch.heightAnchor.constraint(equalToConstant: 30),
            _switch.widthAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}


extension UISwitch {
    func offTintColor(color: UIColor ) {
        let minSide = min(bounds.size.height, bounds.size.width)
        layer.cornerRadius = minSide / 2
        backgroundColor = color
        tintColor = color
    }
}
