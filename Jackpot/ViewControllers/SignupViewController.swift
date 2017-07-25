//
//  SignupViewController.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/24/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorTextLabel: UILabel!
    private var httpClient: JPHttpClient?
    public var initialEmailText: String?
    public var initialPasswordText: String?
    public var onComplete: (() -> Void)?
    
    // MARK: Actions
    @IBAction func signupButtonClicked(_ sender: UIButton) {
        
        // Remove focus from the text fields.
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        // Get the text field values
        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        // Validate the name, email, and password TODO: Validate better
        if (name == "" || email == "" || password == ""){
            self.errorTextLabel.text = "Invalid credentials."
            return
        }
        
        // Make the signup request
        httpClient?.postSignup(name: name, email: email, password: password, completion: { (result: AuthenticationDTO?) in
            guard let result = result else{
                self.errorTextLabel.text = "Authentication failed."
                return
            }
            guard let success = result.success, success else{
                self.errorTextLabel.text = result.message
                return
            }
            
            if let user = result.user{
                Authentication.setUser(user: user)
                self.dismiss(animated: false, completion: self.onComplete)
            } else{
                self.errorTextLabel.text = "Failed to get user info."
            }
        })
    }
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    // MARK: UITextFieldDelegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        errorTextLabel.text = ""
    }
    
    // MARK: UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        httpClient = JPHttpClient()
        
        // Setup the text field delegates
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // Set intial text
        errorTextLabel.text = ""
        emailTextField.text = initialEmailText
        passwordTextField.text = initialPasswordText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
