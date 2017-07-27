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
	
	@IBAction func joinGroupButtonClicked(_ sender: UIButton) {
		// Remove focus from the text fields.
		groupNameTextField.resignFirstResponder()
		passwordTextField.resignFirstResponder()
		descriptionTextView.resignFirstResponder()
		
		// Get the text field values
		guard let user = Authentication.getUser(), let name = groupNameTextField.text, let password = passwordTextField.text else {
			return
		}
		
		// Validate the fields
		if (name == "" || password == ""){
			errorLabel.text = "Must provide a value for all fields."
			return
		}
		
		// Make the request
		httpClient?.postJoinGroup(user: user, name: name, password: password, completion: { (result: GroupDTO?) in
			guard let result = result else{
				self.errorLabel.text = "Join group failed."
				return
			}
			guard let success = result.success, success else{
				self.errorLabel.text = result.message
				return
			}
			self.dismiss(animated: true, completion: self.onComplete)
		})
	}
	
		@IBAction func createGroupButtonClicked(_ sender: UIButton) {
			// Remove focus from the text fields.
			groupNameTextField.resignFirstResponder()
			passwordTextField.resignFirstResponder()
			descriptionTextView.resignFirstResponder()
			
			// Get the text field values
			guard let user = Authentication.getUser(), let name = groupNameTextField.text, let password = passwordTextField.text, let description = descriptionTextView.text else {
				return
			}
			
			// Validate the fields
			if (name == "" || password == "" || description == ""){
				errorLabel.text = "Must provide a value for all fields."
				return
			}
			
			// Make the request
			httpClient?.postCreateGroup(user: user, name: name, password: password, description: description, completion: { (result: GroupDTO?) in
				guard let result = result else{
					self.errorLabel.text = "Create Group Failed."
					return
				}
				guard let success = result.success, success else{
					self.errorLabel.text = result.message
					return
				}
				self.dismiss(animated: true, completion: self.onComplete)
			})
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
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text.elementsEqual("\n"){
            textView.resignFirstResponder()
            return false
        }
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
