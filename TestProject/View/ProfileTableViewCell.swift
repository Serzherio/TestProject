//
//  PostTableViewCell.swift
//  TestProject
//
//  Created by Сергей on 14.04.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    var headerView : ProfileView!
    var userName = String()
    var userBio = String()
    var wide: CGFloat = 0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        headerView = ProfileView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerView.wide = wide
        headerView.nameTitle.text = userName
        headerView.descriptionTitle.text = userBio
    }
    
    private func layout() {
        addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            headerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
