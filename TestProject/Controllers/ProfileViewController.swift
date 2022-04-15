//
//  ProfileViewController.swift
//  TestProject
//
//  Created by Сергей on 13.04.2022.
//

import UIKit
import RealmSwift


class ProfileViewController: UIViewController {
    
    // UIElements
    let changeAvatarButton = UIButton(type: .system)
    let changeCoverButton = UIButton(type: .system)
    let changeBioButton = UIButton(type: .system)
    var profilePictureView = ProfileImageView(profileImage: UIImageView(), button: UIButton())
    var coverPictureView = CoverImageView()
    var bioView = BioView()
    
    // Variables
    var user: Results<User>!
    private var isAvatarImageChanged: Bool = true
    private var isAllowToSaveBio: Bool = false

    //VC lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        customEditButtons()
        customDesign()
        layout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        user = realm.objects(User.self)
        let currentUser = user[0]
        coverPictureView.height = view.layer.frame.height
        profilePictureView.height = view.layer.frame.height
        profilePictureView.profileImage.image = UIImage(data: currentUser.avatarImageData)
        coverPictureView.coverImage.image = UIImage(data: currentUser.coverImageData)
        profilePictureView.headLabel.text = "Profile Picture"
        coverPictureView.headLabel.text = "Cover Photo"
        bioView.bioTextField.placeholder = "Describe youself..."
        bioView.bioTextField.text = currentUser.bio
        bioView.headLabel.text = "Bio"
        coverPictureView.layoutIfNeeded()
        profilePictureView.layoutIfNeeded()
    }
 
    // customize UI Elements
    private func customEditButtons() {
        changeAvatarButton.setTitle("Edit", for: .normal)
        changeAvatarButton.titleLabel?.font = .systemFont(ofSize: 18)
        changeAvatarButton.addTarget(self, action: #selector(changeAvatarButtonPressed), for: .touchUpInside)
        changeCoverButton.setTitle("Edit", for: .normal)
        changeCoverButton.titleLabel?.font = .systemFont(ofSize: 18)
        changeCoverButton.addTarget(self, action: #selector(changeCoverButtonPressed), for: .touchUpInside)
        changeBioButton.setTitle("Edit", for: .normal)
        changeBioButton.titleLabel?.font = .systemFont(ofSize: 18)
        changeBioButton.addTarget(self, action: #selector(changeBioButtonPressed), for: .touchUpInside)
    }
    private func customDesign() {
        profilePictureView.button = changeAvatarButton
        coverPictureView.button = changeCoverButton
        bioView.button = changeBioButton
        bioView.bioTextField.isEnabled = false
        bioView.bioTextField.addTarget(self, action: #selector(textFieldEditing), for: .editingChanged)
    }

    // layout
    private func layout() {
        profilePictureView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profilePictureView)
        coverPictureView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(coverPictureView)
        bioView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioView)
        NSLayoutConstraint.activate([
            profilePictureView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            profilePictureView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profilePictureView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            coverPictureView.topAnchor.constraint(equalTo: profilePictureView.bottomAnchor, constant: 0),
            coverPictureView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            coverPictureView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            bioView.topAnchor.constraint(equalTo: coverPictureView.bottomAnchor, constant: 0),
            bioView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bioView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
//    MARK: - Users Actions
    @objc private func changeAvatarButtonPressed() {
        isAvatarImageChanged = true
        changeImage()
    }
    @objc private func changeCoverButtonPressed() {
        isAvatarImageChanged = false
        changeImage()
    }
    @objc private func changeBioButtonPressed() {
        bioView.bioTextField.isEnabled = true
        bioView.bioTextField.becomeFirstResponder()
        
        if isAllowToSaveBio {
            isAllowToSaveBio = false
            try! realm.write {
                user[0].bio = bioView.bioTextField.text ?? ""
            }
            changeBioButton.setTitle("Edit", for: .normal)
            bioView.bioTextField.isEnabled = false
        }
    }
    
    private func changeImage() {
            let addPhotoAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Камера", style: .default) { _ in
                self.chooseImagePicker(sourse: .camera)
            }
            let photo = UIAlertAction(title: "Фото", style: .default, handler: { _ in
                self.chooseImagePicker(sourse: .photoLibrary)
            })
            let cancel = UIAlertAction(title: "Отмена", style: .cancel)
            addPhotoAlert.addAction(camera)
            addPhotoAlert.addAction(photo)
            addPhotoAlert.addAction(cancel)
            present(addPhotoAlert, animated: true)
    }
    
}

// MARK: - TextFieldEditing
extension ProfileViewController {
    
    @objc private func textFieldEditing() {
        changeBioButton.setTitle("Save", for: .normal)
        isAllowToSaveBio = true
    }
}

// MARK: - Work with image
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(sourse: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourse){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        switch isAvatarImageChanged {
        case true:
            let newImage = info[.editedImage] as? UIImage
            profilePictureView.profileImage.image = newImage
            try! realm.write {
                user[0].avatarImageData = (newImage?.pngData()) ?? Data()
            }

        case false:
            let newImage = info[.editedImage] as? UIImage
            coverPictureView.coverImage.image = newImage
            try! realm.write {
                user[0].coverImageData = (newImage?.pngData()) ?? Data()
            }
        }
        dismiss(animated: true)
    }
    
}
