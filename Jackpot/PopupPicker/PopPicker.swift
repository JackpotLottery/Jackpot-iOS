//
//  PopPicker.swift
//  Jackpot
//
//  Created by Nicholas Miller on 7/26/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

public class PopPicker: NSObject, UIPopoverPresentationControllerDelegate, PickerViewControllerDelegate {
	
	
	public typealias PopPickerCallback = ((_ selection : String, _ forTextField : UITextField) ->())
	
	var pickerVC : PopPickerViewController
	var popover : UIPopoverPresentationController?
	var textField : UITextField!
	var dataChanged : PopPickerCallback?
	var presented = false
	var offset : CGFloat = 8.0
	
	public init(forTextField: UITextField) {
		
		pickerVC = PopPickerViewController()
		self.textField = forTextField
		super.init()
	}
	
	public func setData(data: [String]?){
		pickerVC.dataSource = data
	}
	
	public func pick(_ inViewController : UIViewController, initSelection : String?, dataChanged : @escaping PopPickerCallback) {
		
		if presented {
			return  // we are busy
		}
		
		pickerVC.delegate = self
		pickerVC.modalPresentationStyle = UIModalPresentationStyle.popover
		pickerVC.preferredContentSize = CGSize(width: 500,height: 208)
		pickerVC.currentSelection = initSelection
		
		popover = pickerVC.popoverPresentationController
		if let _popover = popover {
			
			_popover.sourceView = textField
			_popover.sourceRect = CGRect(x: self.offset,y: inViewController.view.bounds.size.height,width: 0,height: 0)
			_popover.delegate = self
			_popover.permittedArrowDirections = UIPopoverArrowDirection(rawValue:0)
			self.dataChanged = dataChanged
			inViewController.present(pickerVC, animated: true, completion: nil)
			presented = true
		}
	}
	
	public func adaptivePresentationStyle(
		for controller: UIPresentationController,
		traitCollection: UITraitCollection)
		-> UIModalPresentationStyle {
			return .none
	}
	
	func pickerVCDismissed(_ selection: String?) {
		if let _dataChanged = dataChanged {
			if let _selection = selection {
				_dataChanged(_selection, textField)
			}
		}
		presented = false
	}
}

