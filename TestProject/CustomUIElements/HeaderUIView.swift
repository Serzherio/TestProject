//
//  HeaderUIView.swift
//  TestProject
//
//  Created by Сергей on 13.04.2022.
//

import UIKit

class ProfileView: UIView {
    
    var coverImage = UIImageView()
    var avatarImage = UIImageView()
    var nameTitle = UILabel(textLabel: "")
    var descriptionTitle = UILabel(textLabel: "")
    var wide : CGFloat = 0
    
    private let circle = UIView()
    private let ringWidth: CGFloat = 40
    private var line = UIView()
    
    init() {
        super.init(frame: .zero)
        customDesign()
        coverImage.image = UIImage(named: "cover")
        avatarImage.image = UIImage(named: "avatar")
    }
    
    private func customDesign() {
        line.backgroundColor = .lightGray
        coverImage.backgroundColor = superview?.backgroundColor
        coverImage.contentMode = .scaleAspectFill
        coverImage.clipsToBounds = true
        avatarImage.contentMode = .scaleAspectFill
        avatarImage.backgroundColor = .clear
        circle.backgroundColor = .white
        nameTitle.font = .boldSystemFont(ofSize: 22)
        descriptionTitle.font = .systemFont(ofSize: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = superview?.backgroundColor
        clipsToBounds = true
        layer.masksToBounds = true
        layer.cornerRadius = wide / 40
        
        avatarImage.layer.cornerRadius = wide / 4
        circle.layer.cornerRadius = (wide / 2 + (ringWidth)) / 2
        avatarImage.clipsToBounds = true
        circle.layer.masksToBounds = true
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(coverImage)
        addSubview(circle)
        addSubview(avatarImage)
        addSubview(nameTitle)
        addSubview(descriptionTitle)
        addSubview(line)
       
        NSLayoutConstraint.activate([
            coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            coverImage.topAnchor.constraint(equalTo: self.topAnchor),
            coverImage.heightAnchor.constraint(equalToConstant: wide / 1.77),
            circle.centerXAnchor.constraint(equalTo: coverImage.centerXAnchor),
            circle.centerYAnchor.constraint(equalTo: coverImage.bottomAnchor),
            circle.widthAnchor.constraint(equalToConstant: wide / 2 + (ringWidth)),
            circle.heightAnchor.constraint(equalToConstant: wide / 2 + (ringWidth)),
            avatarImage.centerXAnchor.constraint(equalTo: circle.centerXAnchor),
            avatarImage.centerYAnchor.constraint(equalTo: circle.centerYAnchor),
            avatarImage.widthAnchor.constraint(equalToConstant: wide / 2),
            avatarImage.heightAnchor.constraint(equalToConstant: wide / 2),
            nameTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameTitle.topAnchor.constraint(equalTo: circle.bottomAnchor, constant: -10),
            descriptionTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionTitle.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 10),
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            line.bottomAnchor.constraint(equalTo: bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
