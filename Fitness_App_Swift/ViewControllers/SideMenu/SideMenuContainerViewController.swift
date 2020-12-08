//
//  SideMenuContainerViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 07.12.2020.
//

import UIKit

class SideMenuContainerViewController: UIViewController, HomeViewControllerDelegate {
    
    var controller: UIViewController!
    var sideMenuViewController: UIViewController!
    var isUnfolded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHomeViewController()
    }
    
    func configureHomeViewController() {
        let homeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        homeViewController.delegate = self
        controller = homeViewController
        view.addSubview(controller.view)
        addChild(controller)
    }
    
    func configureSideMenuViewController() {
        if sideMenuViewController == nil {
            sideMenuViewController = SideMenuViewController()
            view.insertSubview(sideMenuViewController.view, at: 0)
            addChild(sideMenuViewController)
            print("Added mainViewController")
        }
    }
    
    func showSideMenuViewController(doFolding: Bool) {
        if doFolding {
            // unfolding menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.controller.view.frame.origin.x = self.controller.view.frame.width - 140
                           }) { (finished) in
 
                        }
        } else {
            // folding menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.controller.view.frame.origin.x = 0
                           }) { (finished) in
                
                        }
        }
    }
    
    // MARK: HomeViewControllerDelegate
    
    func toggleMenu() {
        print("toggleMenu func executed")
        configureSideMenuViewController()
        isUnfolded = !isUnfolded
        showSideMenuViewController(doFolding: isUnfolded)
    }

    
}
