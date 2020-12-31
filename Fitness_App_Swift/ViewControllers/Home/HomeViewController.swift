//
//  HomeViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 14.10.2020.
//

import UIKit

protocol HomeViewControllerDelegate {
    func toggleMenu()
}

class HomeViewController: UIViewController {

    // MARK: - Variables
    
    @IBOutlet weak var sessionLabel: UILabel!
    @IBOutlet weak var sessionTitleLabel: UILabel!
    @IBOutlet weak var sessionImageView: UIImageView!
    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var sideMenuButton: UIButton!
    
    var delegate: HomeViewControllerDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        sessionImageView.addoverlay(color: .black, alpha: 0.6)
        
        super.viewDidLoad()
        title = "Home"
        
    }
   
    @IBAction func settingsTapped(_ sender: Any) {
        let settingsVC = storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsViewController
        settingsVC.sessionDelegate = self
        settingsVC.sessionFontSizeDelegate = self
        present(settingsVC, animated: true, completion: nil)
    }
    
    
    @IBAction func sideMenuTapped(_ sender: UIButton) {
        delegate?.toggleMenu()
    }
    
}


extension HomeViewController: SettingsViewControllerDelegate {
    func settingsViewController(sessionImage: UIImage, sessionName: String) {
        sessionImageView.image = sessionImage
        sessionLabel.text = sessionName
    }
}
extension HomeViewController: SettingsViewControllerDelegateForPickerView {
    func settingsViewControllerForPickerView(sessionNameFontSize: CGFloat) {
        sessionLabel.font = sessionLabel.font.withSize(sessionNameFontSize)
    }
}
