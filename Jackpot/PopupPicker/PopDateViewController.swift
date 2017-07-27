//
//  PopDateViewController.swift
//  Jackpot
//
//  Created by bradley treuherz on 7/27/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

protocol DataPickerViewControllerDelegate : class {
    
    func datePickerVCDismissed(_ date : Date?)
}

class PopDateViewController : UIViewController {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    weak var delegate : DataPickerViewControllerDelegate?
    
    var currentDate : Date? {
        didSet {
            updatePickerCurrentDate()
        }
    }
    
    convenience init() {
        
        self.init(nibName: "PopDateViewController", bundle: nil)
    }
    
    private func updatePickerCurrentDate() {
        
        if let _currentDate = self.currentDate {
            if let _datePicker = self.datePicker {
                _datePicker.date = _currentDate
            }
        }
    }
    @IBAction func okAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            
            let nsdate = self.datePicker.date
            self.delegate?.datePickerVCDismissed(nsdate)
            
        }
    }
 
    
    override func viewDidLoad() {
        
        updatePickerCurrentDate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        self.delegate?.datePickerVCDismissed(nil)
    }
}
