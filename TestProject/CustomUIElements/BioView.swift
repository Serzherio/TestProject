//
//  BioView.swift
//  TestProject
//
//  Created by Сергей on 14.04.2022.
//

import UIKit

class BioView: UIView {
    
    var button = UIButton()
    var bioTextField = UITextField()
    var headLabel = UILabel()
    private var line = UIView()
    
    init() {
        super.init(frame: .zero)
        customDesign()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.translatesAutoresizingMaskIntoConstraints = false
        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(button)
        addSubview(bioTextField)
        addSubview(headLabel)
        addSubview(line)
        
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            headLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 20),
            bioTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bioTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bioTextField.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 30),
            bioTextField.heightAnchor.constraint(equalToConstant: 30),
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            line.bottomAnchor.constraint(equalTo: bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: 5)
        ])
    }
    
    private func customDesign() {
        line.backgroundColor = .lightGray
        headLabel.font = .boldSystemFont(ofSize: 25)
        bioTextField.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
