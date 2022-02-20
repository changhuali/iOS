//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by hua li on 2022/2/20.
//

import UIKit

class ConversionViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>?
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel() {
        if let fahrenheitValue = fahrenheitValue {
            let celsiusNum = fahrenheitValue.converted(to: .celsius).value
            celsiusLabel.text = "\(numberFormatter.string(from: NSNumber(value: celsiusNum)) ?? "")"
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
        updateCelsiusLabel()
    }
    
    @IBAction func dismissKeyboard() {
        textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsiusLabel()
    }
}
