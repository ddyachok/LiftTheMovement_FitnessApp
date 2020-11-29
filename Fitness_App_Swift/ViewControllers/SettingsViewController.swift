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

class SettingsViewController: UIViewController {

    // MARK: - Variables
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var statusSwitch: UISwitch!
    
    var HomeViewController: HomeViewController?
    var sessionDelegate: SettingsViewControllerDelegate!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchDidChange(_ sender: UISwitch) {
        let newImage = UIImage(named: sender.isOn ? "session_complete" : "pancake_stretch")
        let newSessionName = sender.isOn ? "SESSION COMPLETE" : "PANCAKE STRETCH"
        
        sessionDelegate?.settingsViewController(sessionImage: newImage!, sessionName: newSessionName)
    }
    
    
}
