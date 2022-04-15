//
//  CoverImageView.swift
//  TestProject
//
//  Created by Сергей on 14.04.2022.
//

import UIKit

class CoverImageView: UIView {

    var button = UIButton()
    var coverImage = UIImageView()
    var headLabel = UILabel()
    var height: CGFloat = 0
    private var line = UIView()
    
    init() {
        super.init(frame: .zero)
        customDesign()
    }

    private func customDesign() {
        backgroundColor = .clear
        line.backgroundColor = .lightGray
        coverImage.contentMode = .scaleAspectFill
        headLabel.font = .boldSystemFont(ofSize: 25)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        coverImage.layer.cornerRadius = 10
        coverImage.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(coverImage)
        addSubview(headLabel)
        addSubview(line)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            headLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            headLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 20),
            coverImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            coverImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            coverImage.heightAnchor.constraint(equalToConstant: height / 4.33),
            coverImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            coverImage.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 20),
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            line.bottomAnchor.constraint(equalTo: bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 20)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
