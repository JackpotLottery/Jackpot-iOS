//
//  LoginViewController.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/22/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorTextLabel: UILabel!
    private var httpClient: JPHttpClient?
    public var onComplete: (() -> Void)?
    
    
    // MARK: Actions
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        // Remove focus from the text fields.
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        // Get the email and and password from the text fields
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        // Validate the email and password TODO: Validate better
        if (email == "" || password == ""){
            self.errorTextLabel.text = "Invalid credentials."
            return
        }
        
        // Post login request
        httpClient?.postLogin(email: email, password: password, completion: { (result: AuthenticationDTO?) in
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
                self.dismiss(animated: true, completion: self.onComplete)
            } else{
                self.errorTextLabel.text = "Failed to get user info."
            }
        })
    }
    
    @IBAction func signupButtonClicked(_ sender: UIButton) {
        // Launch the Signup page
        let signupViewController = storyboard!.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        signupViewController.initialEmailText = emailTextField.text
        signupViewController.initialPasswordText = passwordTextField.text
        signupViewController.onComplete = signupCompleted
        present(signupViewController, animated:false, completion: nil)
        
    }
    
    func signupCompleted(){
        self.dismiss(animated: true, completion: nil)
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
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // Clear the error message
        errorTextLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
