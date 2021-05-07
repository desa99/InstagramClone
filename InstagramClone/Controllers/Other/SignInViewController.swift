//
//  SignInViewController.swift
//  InstagramClone
//
//  Created by Desanka MIlakovic on 16.4.21..
//
import SafariServices
import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: -sublayers
    private let headerView = SignInHeaderView()
    
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
    
    private var signInButton: UIButton = {
       let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    private var createAccount: UIButton = {
       let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.link, for: .normal)
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

        title = "Sign In"
        view.backgroundColor = .systemBackground
        emailField.delegate = self
        password.delegate = self
        addSubviews()
        addActions()
    }
    
    // MARK: - Actions
    
    private func addActions() {
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        createAccount.addTarget(self, action: #selector(didTapCreteAccount), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacy), for: .touchUpInside)
        
    }
    @objc private func didTapSignIn() {
        emailField.resignFirstResponder()
        password.resignFirstResponder()
        
        guard let email = emailField.text,
              let password = password.text,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else {
            return
        }
    }
    @objc private func didTapCreteAccount() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
        
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
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(password)
        view.addSubview(signInButton)
        view.addSubview(createAccount)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top,
            width: view.width,
            height: (view.height - view.safeAreaInsets.top)/3
        )
        emailField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 20,
            width: view.width - 50,
            height: 50
        )
        password.frame = CGRect(
            x: 25,
            y: emailField.bottom + 10,
            width: view.width - 50,
            height: 50
        )
        signInButton.frame = CGRect(
            x: 35,
            y: password.bottom + 20,
            width: view.width - 70,
            height: 50
        )
        createAccount.frame = CGRect(
            x: 35,
            y: signInButton.bottom + 20,
            width: view.width - 70,
            height: 50
        )
        termsButton.frame = CGRect(
            x: 35,
            y: createAccount.bottom + 50,
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
        if textField == emailField {
            password.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            didTapSignIn()
        }
        return true
    }
}
