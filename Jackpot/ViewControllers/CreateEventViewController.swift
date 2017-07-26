//
//  CreateEventViewController.swift
//  Jackpot
//
//  Created by Nicholas Miller on 7/25/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class CreateEventViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {

	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var locationTextField: UITextField!
	@IBOutlet weak var dateTextField: UITextField!
	@IBOutlet weak var groupTextField: UITextField!
	@IBOutlet weak var tagTextField: UITextField!
	@IBOutlet weak var capacityTextField: UITextField!
	@IBOutlet weak var deadlineTextField: UITextField!
	@IBOutlet weak var descriptionTextView: UITextView!
	@IBOutlet weak var errorLabel: UILabel!
	
	private var date: Date?
	private var deadline: Date?
	
	private var httpClient: JPHttpClient?
	public var onComplete: (() -> Void)?
	
	var eventDatePicker: PopDatePicker?
	var registrationDeadlineDatePicker: PopDatePicker?
	var groupPicker: PopPicker?
	
	@IBAction func createEventButtonClicked(_ sender: UIButton) {
		// Remove focus from the text fields.
		resignAll()
		
		// Get the text field values
		guard let name = nameTextField.text,
			let location = locationTextField.text,
			let date = date,
			let group = groupTextField.text,
			let tag = tagTextField.text,
			let capacity = capacityTextField.text,
			let deadline = deadline,
			let description = descriptionTextView.text
		else {
			errorLabel.text = "Must provide a value for all fields."
			return
		}
		
		// Validate the fields
		if (name == "" ||
			location == "" ||
			group == "" ||
			tag == "" ||
			capacity == "" ||
			description == "")
		{
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
	
	@IBAction func cancelButtonClicked(_ sender: Any) {
		self.dismiss(animated: false, completion: nil)
	}
	
	func getGroups(){
		// TODO: Make network call
		groupPicker?.setData(data: ["Group 1", "Group 2", "Group 3", "Group4", "Group 5"])
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		httpClient = JPHttpClient()
		tableView.separatorStyle = .none
		
		// Setup Pickers
		eventDatePicker = PopDatePicker(forTextField: dateTextField)
		registrationDeadlineDatePicker = PopDatePicker(forTextField: deadlineTextField)
		groupPicker = PopPicker(forTextField: groupTextField)
		getGroups()
		
		// Setup Delegates
		nameTextField.delegate = self
		locationTextField.delegate = self
		dateTextField.delegate = self
		groupTextField.delegate = self
		tagTextField.delegate = self
		capacityTextField.delegate = self
		deadlineTextField.delegate = self
		descriptionTextView.delegate = self
		errorLabel?.text = ""
	}
	
	func resignAll(){
		nameTextField.resignFirstResponder()
		locationTextField.resignFirstResponder()
		dateTextField.resignFirstResponder()
		groupTextField.resignFirstResponder()
		tagTextField.resignFirstResponder()
		capacityTextField.resignFirstResponder()
		deadlineTextField.resignFirstResponder()
		descriptionTextView.resignFirstResponder()
	}
	
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		if (textField === dateTextField) {
			resignAll()
			let formatter = DateFormatter()
			formatter.dateStyle = .medium
			formatter.timeStyle = .medium
			
			var initDate : Date? = formatter.date(from: dateTextField.text!)
			if (dateTextField.text == nil || dateTextField.text == ""){
				initDate = Date()
			}
			
			let dataChangedCallback : PopDatePicker.PopDatePickerCallback = { (newDate : Date, forTextField : UITextField) -> () in
					forTextField.text = (newDate.ToDateMediumString() ?? "?") as String
					self.date = newDate
			}
			eventDatePicker!.pick(self, initDate: initDate, dataChanged: dataChangedCallback)
			return false
		}
		else if (textField == deadlineTextField){
			resignAll()
			let formatter = DateFormatter()
			formatter.dateStyle = .medium
			formatter.timeStyle = .medium
			
			var initDate : Date? = formatter.date(from: deadlineTextField.text!)
			if (deadlineTextField.text == nil || deadlineTextField.text == ""){
				initDate = Date()
			}
			
			let dataChangedCallback : PopDatePicker.PopDatePickerCallback = { (newDate : Date, forTextField : UITextField) -> () in
				forTextField.text = (newDate.ToDateMediumString() ?? "?") as String
				self.deadline = newDate
			}
			registrationDeadlineDatePicker!.pick(self, initDate: initDate, dataChanged: dataChangedCallback)
			return false
		}
		else if (textField == groupTextField){
			resignAll()
			
			let initValue = groupTextField.text
			
			let dataChangedCallback : PopPicker.PopPickerCallback = { (selection : String, forTextField : UITextField) -> () in
				forTextField.text = selection
			}
			groupPicker!.pick(self, initSelection: initValue, dataChanged: dataChangedCallback)
			return false
		}
		else {
			return true
		}
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
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		resignAll()
		tableView.deselectRow(at: indexPath, animated: false)
	}

}
