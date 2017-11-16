//
//  SignInController.swift
//  reSwift
//
//  Created by Ruslan Yupyn on 10/16/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class SignInController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var credentialsContainer: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        credentialsContainer.layer.borderColor = UIColor(white: 233.0 / 255.0, alpha: 1.0).cgColor
        signInButton.isEnabled = false
        signInButton.backgroundColor = .gray
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for txtField in [emailTextField, passwordTextField] {
            txtField?.text = ""
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = .black
        let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        var email = emailTextField.text!
        var password = passwordTextField.text!
        switch textField {
        case emailTextField:
            email = newString
        case passwordTextField:
            password = newString
        default:
            break
        }
        signInButton.isEnabled = isEmailVerification(email: email) && password.count > 5
        signInButton.backgroundColor = signInButton.isEnabled ? UIColor(red:0.56, green:0.17, blue:0.13, alpha:1.0) : .gray
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            if isEmailVerification(email: textField.text ?? "") {
                passwordTextField.becomeFirstResponder()
            } else {
                emailTextField.textColor = .red
            }
        case passwordTextField:
            if textField.text!.count > 5 {
                view.endEditing(true)
            } else {
                passwordTextField.textColor = .red
            }
        default:
            break
        }
        return true
    }
    
    func isEmailVerification(email: String) -> Bool {
        return email.isValidEmail()
    }
}

extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
            "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
            "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) != nil
    }
}
