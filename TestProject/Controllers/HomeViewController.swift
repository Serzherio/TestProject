//
//  ViewController.swift
//  TestProject
//
//  Created by Сергей on 13.04.2022.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    // UIElements
    let postTableView = UITableView(frame: .zero, style: .grouped)
    
    // Variables
    var user: Results<User>!
    var posts: [Post]!

    // VC lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        customDesign()
        customizePostTableView()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDataFromModel()
        postTableView.reloadData()
    }
    
    //data from model
    //if realm storage isEmpy -> use mock data to show
    private func updateDataFromModel() {
        user = realm.objects(User.self)
        if user.count == 0 {
            saveMockUserData()
        }
        posts = [
            Post(avatarImage: UIImage(named: "avatar") ?? UIImage(), authorName: "123", postImage: UIImage(named: "postImage") ?? UIImage()),
            Post(avatarImage: UIImage(named: "avatar") ?? UIImage(), authorName: "231", postImage: UIImage(named: "postImage") ?? UIImage())
                ]
    }
    
    private func saveMockUserData() {
        let mockUser = User(name: "John Doe", bio: "This is Bio",
                            avatarImageData: UIImage(named: "avatar")!.pngData()!,
                            coverImageData: UIImage(named: "cover")!.pngData()!)
        StorageManager.saveUser(mockUser)
    }
    
    // custom layout
    private func customDesign() {
        view.backgroundColor = .white
    }
    private func customizePostTableView() {
        postTableView.delegate = self
        postTableView.dataSource = self
        postTableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileCell")
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        postTableView.backgroundColor = .clear
        postTableView.separatorColor = .clear
    }
    private func layout() {
        view.addSubview(postTableView)
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            postTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
// customize Table View
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        default: return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileTableViewCell
            cell.selectionStyle = .none
            cell.wide = self.view.layer.frame.width
            let currentUser = user[indexPath.row]
            cell.userName = currentUser.name
            cell.userBio = currentUser.bio
            cell.headerView.avatarImage.image = UIImage(data: currentUser.avatarImageData)
            cell.headerView.coverImage.image = UIImage(data: currentUser.coverImageData)
            cell.layoutIfNeeded()
            return cell
        } else {
            let currentUser = user[0]
            let post = posts[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostTableViewCell
            cell.selectionStyle = .none
            cell.avatarCircleImage.image = UIImage(data: currentUser.avatarImageData)
            cell.nameLabel.text = currentUser.name
            cell.postText.text = post.postText
            cell.postImage.image = post.postImage
            cell.layoutIfNeeded()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 400
        } else {
            return 450
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return 0
        default: return 30
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return ""
        default: return "Posts"
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .black
        header.textLabel?.font = .systemFont(ofSize: 24)
    }
    
}

