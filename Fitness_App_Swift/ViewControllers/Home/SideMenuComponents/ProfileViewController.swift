//
//  ProfileViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 16.12.2020.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        homeVC.modalPresentationStyle = .fullScreen
        dismissVC()
    }
    
    func dismissVC() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        self.view.window!.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false)
    }
    
}
