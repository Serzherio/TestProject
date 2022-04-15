//
//  ProfileImageView.swift
//  TestProject
//
//  Created by Сергей on 14.04.2022.
//

import UIKit

class ProfileImageView: UIView {

    var button = UIButton()
    var profileImage = UIImageView()
    var headLabel = UILabel()
    var height: CGFloat = 0
    private var line = UIView()
    
    init(profileImage: UIImageView, button: UIButton) {
        super.init(frame: .zero)
        self.button = button
        self.profileImage = profileImage
        customDesign()
    }
    
    private func customDesign() {
        backgroundColor = .clear
        line.backgroundColor = .lightGray
        headLabel.font = .boldSystemFont(ofSize: 25)
        profileImage.clipsToBounds = true
        profileImage.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.layer.cornerRadius = (height/5.62)/2

        button.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(profileImage)
        addSubview(headLabel)
        addSubview(line)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            headLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 20),
            profileImage.widthAnchor.constraint(equalToConstant: height/5.62),
            profileImage.heightAnchor.constraint(equalToConstant: height/5.62),
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            line.bottomAnchor.constraint(equalTo: bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
