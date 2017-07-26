//
//  CreateGroupViewController.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/25/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
		private var httpClient: JPHttpClient?
		public var onComplete: (() -> Void)?
	
		@IBOutlet weak var groupNameTextField: UITextField!
		@IBOutlet weak var passwordTextField: UITextField!
		@IBOutlet weak var descriptionTextView: UITextView!
		@IBOutlet weak var errorLabel: UILabel!
	
	
		@IBAction func createGroupButtonClicked(_ sender: UIButton) {
			// Remove focus from the text fields.
			groupNameTextField.resignFirstResponder()
			passwordTextField.resignFirstResponder()
			descriptionTextView.resignFirstResponder()
			
			// Get the text field values
			guard let name = groupNameTextField.text, let password = passwordTextField.text, let description = descriptionTextView.text else {
				return
			}
			
			// Validate the fields
			if (name == "" || password == "" || description == ""){
				errorLabel.text = "Must provide a value for all fields."
				return
			}
			
			// Make the signup request
//			httpClient?.postCreateGroup(name: name, email: email, password: password, completion: { (result: AuthenticationDTO?) in
//				guard let result = result else{
//					self.errorTextLabel.text = "Authentication failed."
//					return
//				}
//				guard let success = result.success, success else{
//					self.errorTextLabel.text = result.message
//					return
//				}
//
//				if let user = result.user{
//					Authentication.setUser(user: user)
//					self.dismiss(animated: false, completion: self.onComplete)
//				} else{
//					self.errorTextLabel.text = "Failed to get user info."
//				}
//			})
			self.dismiss(animated: true, completion: onComplete)
		}
		@IBAction func cancelButtonClicked(_ sender: UIButton) {
			self.dismiss(animated: true, completion: nil)
		}
	
	
		func textFieldShouldReturn(_ textField: UITextField) -> Bool {
			textField.resignFirstResponder()
			return true
		}
	
		func textFieldDidBeginEditing(_ textField: UITextField){
			errorLabel.text = ""
		}
	
		func textViewDidBeginEditing(_ textView: UITextView) {
			errorLabel.text = ""
		}
	
		func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
			textView.resignFirstResponder()
			return true
		}
	
		override func viewDidLoad() {
        super.viewDidLoad()
				httpClient = JPHttpClient()
			
				// Setup the text field delegates
				groupNameTextField.delegate = self
				passwordTextField.delegate = self
				descriptionTextView.delegate = self
			
				errorLabel.text = ""
    }
}
