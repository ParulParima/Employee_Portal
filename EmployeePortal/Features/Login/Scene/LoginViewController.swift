//
//  LoginViewController.swift
//  EmployeePortal
//
//  Created by ParulParima on 10/31/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var submitButton: UIButton!
    
    var viewModel: LoginViewModel!
    weak var navigator: FeaturesCoordinator?
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "LoginViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        NotificationCenter.default.removeObserver(self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.setupInterface()
    }
    
    func setupInterface() {
        email.delegate = self
        password.delegate = self
        password.isSecureTextEntry = true
        
        submitButton.clipsToBounds = false
        submitButton.layer.cornerRadius = 8
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if email.text == "" || password.text == "" {
            self.showAlert(title: "Required", message: "Please enter Email and Password")
        }
        else {
            
            viewModel.loginAuthentication(email: email.text!, password: password.text!) {
                DispatchQueue.main.async {
                    if self.viewModel.error != nil {
                        self.showAlert(title: "Invalid Credentials", message: "Wrong Password or Email")
                        self.email.text = ""
                        self.password.text = ""
                        self.viewModel.error = nil
                    }
                    else {
                        self.navigator?.dashboard()
                    }
                }
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in                           }))
        self.present(alert, animated: false, completion: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        textField.resignFirstResponder()
        return false
    }
}

extension LoginViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.bottomConstraint.constant = keyboardSize.height + 10
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            self.bottomConstraint.constant = 200
            self.view.layoutIfNeeded()
        }
    }
}


