//
//  SignUpViewController.swift
//  InstagramClone
//
//  Created by Desanka MIlakovic on 16.4.21..
//

import SafariServices
import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: -properties
    private var profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = . scaleToFill
        imageView.image = UIImage(systemName: "person.circle")
        imageView.tintColor = .systemGray
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 45
        return imageView
    }()
    private var usernameField: IGTextField = {
       let field = IGTextField()
        field.placeholder = "Username"
        field.keyboardType = .default
        field.returnKeyType = .next
        
        return field
    }()
    private var emailField: IGTextField = {
       let field = IGTextField()
        field.placeholder = "Email Address"
        field.keyboardType = .emailAddress
        field.returnKeyType = .next
        
        return field
    }()
    private var password: IGTextField = {
       let field = IGTextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.keyboardType = .default
        field.returnKeyType = .continue
        
        return field
    }()
    
    private var signUpButton: UIButton = {
       let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
 
    private var termsButton: UIButton = {
       let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.link, for: .normal)
        return button
    }()
    private var privacyButton: UIButton = {
       let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.link, for: .normal)
        return button
    }()
    
   // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign Up"
        view.backgroundColor = .systemBackground
        usernameField.delegate = self
        emailField.delegate = self
        password.delegate = self
        addSubviews()
        addActions()
        addImageGesture()
    }
    // MARK: - gestire
    private func addImageGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapPrifilePicture))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tap)
    }
    
    // MARK: - Actions
    
    @objc func didTapPrifilePicture() {
        let sheet = UIAlertController(title: "Profile Picture", message: "Set your picture, help your friends find you", preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Take a photo", style: .default, handler: {  [weak self] _ in
            DispatchQueue.main.async {
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.allowsEditing = true
                picker.delegate = self
                self?.present(picker, animated: true, completion: nil)
            }
        }))
        
        sheet.addAction(UIAlertAction(title: "Choose a photo", style: .default, handler: { [weak self] _ in
            DispatchQueue.main.async {
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.allowsEditing = true
                picker.delegate = self
                self?.present(picker, animated: true, completion: nil)
            }
            
        }))
        present(sheet, animated: true)
    }
    
    private func addActions() {
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        
        termsButton.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacy), for: .touchUpInside)
        
    }
    @objc private func didTapSignUp() {
        emailField.resignFirstResponder()
        emailField.resignFirstResponder()
        password.resignFirstResponder()
        
        guard let username = usernameField.text,
              let email = emailField.text,
              let password = password.text,
              username.trimmingCharacters(in: .alphanumerics).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6,
              username.count >= 2 else {
            let alert = UIAlertController(title: "Wooops", message: "Please make sure to fill all fields, and have a password longer than 6 characters.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        
    }
    @objc private func didTapTerms() {
        guard let url = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    @objc private func didTapPrivacy() {
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    private func addSubviews() {
        view.addSubview(profileImageView)
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(password)
        view.addSubview(signUpButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let imageSize: CGFloat = 90
        
        profileImageView.frame = CGRect(
            x: (view.width - imageSize)/2,
            y: view.safeAreaInsets.top + 10,
            width: imageSize,
            height: imageSize
        )
        usernameField.frame = CGRect(
            x: 25,
            y: profileImageView.bottom + 20,
            width: view.width - 50,
            height: 50
        )
        emailField.frame = CGRect(
            x: 25,
            y: usernameField.bottom + 10,
            width: view.width - 50,
            height: 50
        )
        password.frame = CGRect(
            x: 25,
            y: emailField.bottom + 10,
            width: view.width - 50,
            height: 50
        )
        signUpButton.frame = CGRect(
            x: 35,
            y: password.bottom + 20,
            width: view.width - 70,
            height: 50
        )
     
        termsButton.frame = CGRect(
            x: 35,
            y: signUpButton.bottom + 50,
            width: view.width - 70,
            height: 40
        )
        privacyButton.frame = CGRect(
            x: 35,
            y: termsButton.bottom + 10,
            width: view.width - 70,
            height: 40
        )
   }
    
    // MARK: -TextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            
        } else if textField == emailField {
            password.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            didTapSignUp()
        }
        return true
    }
    
    // MARK: - ImagePicker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        profileImageView.image = image
    }
}
