//
//  PostTableViewCell.swift
//  TestProject
//
//  Created by Сергей on 14.04.2022.
//


import UIKit

class PostTableViewCell: UITableViewCell {
    
    var avatarCircleImage = UIImageView()
    var nameLabel = UILabel(textLabel: "")
    var postText = UITextView()
    var postImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customDesign()
        layout()
    }
    private func customDesign() {
        avatarCircleImage.layer.cornerRadius = 20
        nameLabel.font = .boldSystemFont(ofSize: 14)
        postText.font = .systemFont(ofSize: 14)
        avatarCircleImage.backgroundColor = .clear
        avatarCircleImage.clipsToBounds = true
        postText.backgroundColor = .clear
        postImage.backgroundColor = .clear
    }
    private func layout() {
        addSubview(avatarCircleImage)
        addSubview(nameLabel)
        addSubview(postText)
        addSubview(postImage)
        avatarCircleImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        postText.translatesAutoresizingMaskIntoConstraints = false
        postImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarCircleImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            avatarCircleImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            avatarCircleImage.widthAnchor.constraint(equalToConstant: 40),
            avatarCircleImage.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: avatarCircleImage.trailingAnchor, constant: 5),
            postText.topAnchor.constraint(equalTo: avatarCircleImage.bottomAnchor, constant: 20),
            postText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            postText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            postText.heightAnchor.constraint(equalToConstant: 80),
            postImage.topAnchor.constraint(equalTo: postText.bottomAnchor, constant: 20),
            postImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            postImage.heightAnchor.constraint(equalToConstant: 235)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

