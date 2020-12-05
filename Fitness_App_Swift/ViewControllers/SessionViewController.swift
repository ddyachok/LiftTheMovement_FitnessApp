//
//  SessionViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 21.10.2020.
//

import UIKit

class SessionViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Session"

    }
    

    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
