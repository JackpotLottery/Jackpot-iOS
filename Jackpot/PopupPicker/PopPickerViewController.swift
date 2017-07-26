//
//  PopPickerViewController.swift
//  Jackpot
//
//  Created by Nicholas Miller on 7/26/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit


import UIKit

protocol PickerViewControllerDelegate : class {
	
	func pickerVCDismissed(_ selection : String?)
}

class PopPickerViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		if let count = dataSource?.count{
			return count
		} else{
			return 0
		}
  }
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return dataSource?[row]
	}
	
	@IBOutlet weak var container: UIView!
	@IBOutlet weak var picker: UIPickerView!
	weak var delegate : PickerViewControllerDelegate?
	var dataSource : [String]?{
		didSet{
			picker?.reloadAllComponents()
		}
	}
	
	var currentSelection : String? {
		didSet {
			updatePickerCurrentSelection()
		}
	}
	
	convenience init() {
		
		self.init(nibName: "PopPickerViewController", bundle: nil)
	}
	
	private func updatePickerCurrentSelection() {
		
		if let _currentSelection = self.currentSelection {
			if let _picker = self.picker {
				if let index = dataSource?.index(of: _currentSelection){
					_picker.selectRow(index, inComponent: 0, animated: false)
				}
			}
		}
	}
	
	@IBAction func okClicked(_ sender: UIButton) {
		self.dismiss(animated: true) {
			let row = self.picker.selectedRow(inComponent: 0)
			self.delegate?.pickerVCDismissed(self.dataSource?[row])
		}
	}
	
	override func viewDidLoad() {
		updatePickerCurrentSelection()
		picker.dataSource = self
		picker.delegate = self
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		
		self.delegate?.pickerVCDismissed(nil)
	}
}
