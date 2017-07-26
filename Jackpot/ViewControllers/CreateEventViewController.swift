//
//  CreateEventViewController.swift
//  Jackpot
//
//  Created by Nicholas Miller on 7/25/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class CreateEventViewController: UITableViewController, UITextFieldDelegate {

	@IBOutlet weak var nameLabel: UITextField!
	private var httpClient: JPHttpClient?
	public var onComplete: (() -> Void)?
	
	var popDatePicker: PopDatePicker?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		httpClient = JPHttpClient()
		
		tableView.separatorStyle = .none
		popDatePicker = PopDatePicker(forTextField: nameLabel) // TODO: Don't use this textField
		nameLabel.delegate = self
		// Setup the text field delegates
		//		groupNameTextField.delegate = self
		//		passwordTextField.delegate = self
		//		descriptionTextView.delegate = self
		//
		//		errorLabel.text = ""
	}
	
	func resignAll(){
		nameLabel.resignFirstResponder()
	}
	
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		if (textField === nameLabel) {
			resignAll()
			let formatter = DateFormatter()
			formatter.dateStyle = .medium
			formatter.timeStyle = .none
			let initDate : Date? = formatter.date(from: nameLabel.text!)
			
			let dataChangedCallback : PopDatePicker.PopDatePickerCallback = { (newDate : Date, forTextField : UITextField) -> () in
				
				// here we don't use self (no retain cycle)
				forTextField.text = (newDate.ToDateMediumString() ?? "?") as String
				
			}
			
			popDatePicker!.pick(self, initDate: initDate, dataChanged: dataChangedCallback)
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
	
//	func textFieldDidBeginEditing(_ textField: UITextField){
//		errorLabel.text = ""
//	}
//
//	func textViewDidBeginEditing(_ textView: UITextView) {
//		errorLabel.text = ""
//	}
//
	func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
		textView.resignFirstResponder()
		return true
	}

}
