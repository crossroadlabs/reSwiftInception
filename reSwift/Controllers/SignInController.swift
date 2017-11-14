//
//  SignInController.swift
//  reSwift
//
//  Created by Ruslan Yupyn on 10/16/17.
//  Copyright © 2017 Crossroad Labs s.r.o. All rights reserved.
//

import UIKit

class SignInController: UIViewController {

    @IBOutlet weak var credentialsContainer: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        credentialsContainer.layer.borderColor = UIColor(white: 233.0 / 255.0, alpha: 1.0).cgColor
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

