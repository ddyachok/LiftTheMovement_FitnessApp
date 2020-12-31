//
//  SettingsViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 31.10.2020.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsViewController(sessionImage: UIImage, sessionName: String)
}

protocol SettingsViewControllerDelegateForPickerView: class {
    func settingsViewControllerForPickerView(sessionNameFontSize: CGFloat)
}


class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    // MARK: - Variables
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var fontSizePickerView: UIPickerView!
    
    var HomeViewController: HomeViewController?
    var sessionDelegate: SettingsViewControllerDelegate!
    var sessionFontSizeDelegate: SettingsViewControllerDelegateForPickerView!
    
    let fontSizePickerValues = ["Small", "Medium", "Large"]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        
        
        fontSizePickerView.delegate = self
        fontSizePickerView.dataSource = self
        fontSizePickerView.selectRow(1, inComponent: 0, animated: true)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        let newImage = UIImage(named: sender.isOn ? "session_complete" : "pancake_stretch")
        let newSessionName = sender.isOn ? "SESSION COMPLETE" : "PANCAKE STRETCH"
        
        sessionDelegate?.settingsViewController(sessionImage: newImage!, sessionName: newSessionName)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontSizePickerValues.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontSizePickerValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            sessionFontSizeDelegate?.settingsViewControllerForPickerView(sessionNameFontSize: 21.0)
        case 1:
            sessionFontSizeDelegate?.settingsViewControllerForPickerView(sessionNameFontSize: 27.0)
        case 2:
            sessionFontSizeDelegate?.settingsViewControllerForPickerView(sessionNameFontSize: 31.0)
        default:
            break
        }
    }

}
