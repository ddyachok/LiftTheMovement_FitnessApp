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
        if sender.isOn {
            sessionDelegate?.settingsViewController(sessionImage: UIImage(named: "session_complete")!, sessionName: "SESSION COMPLETE")
        }
        else {
            sessionDelegate?.settingsViewController(sessionImage: UIImage(named: "pancake_stretch")!, sessionName: "PANCAKE STRETCH")
        }
    }
    
    
}
