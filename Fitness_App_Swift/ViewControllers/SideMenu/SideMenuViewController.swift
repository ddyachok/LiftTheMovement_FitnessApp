//
//  SideMenuViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 07.12.2020.
//

import UIKit

protocol SideMenuViewControllerDelegate {
    func toggleMenu()
    func showSideMenuViewController(doFolding: Bool)
}

class SideMenuViewController: UIViewController {
    
    var sideMenuItemsTableV: UITableView!
    var sideMenuModel: [SideMenuModel] = []
    var delegate: SideMenuViewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        configureSideMenuItemsTableV()
    }
    
    func configureSideMenuItemsTableV() {
        sideMenuItemsTableV = UITableView()
        sideMenuItemsTableV.delegate = self
        sideMenuItemsTableV.dataSource = self
        sideMenuItemsTableV.register(SideMenuTableViewCell.self, forCellReuseIdentifier: SideMenuTableViewCell.reuseId)
        view.addSubview(sideMenuItemsTableV)
        sideMenuItemsTableV.frame = view.bounds
        
        sideMenuItemsTableV.separatorStyle = .none
        sideMenuItemsTableV.rowHeight = 100
    }

}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideMenuItemsTableV.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.reuseId) as! SideMenuTableViewCell
        let sideMenuModel = SideMenuModel(rawValue: indexPath.row)
        cell.menuLabel.text = sideMenuModel?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let sideMenuModel = SideMenuModel(rawValue: indexPath.row)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mapVC = storyBoard.instantiateViewController(withIdentifier: "MapVC") as! MapViewController
        mapVC.modalPresentationStyle = .fullScreen
        let profileVC = storyBoard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
        profileVC.modalPresentationStyle = .fullScreen
        let exercisesVC = storyBoard.instantiateViewController(withIdentifier: "ExercisesVC") as! ExercisesViewController
        exercisesVC.modalPresentationStyle = .fullScreen
        let coachesVC = storyBoard.instantiateViewController(withIdentifier: "CoachesVC") as! CoachesViewController
        coachesVC.modalPresentationStyle = .fullScreen
        
        if sideMenuModel?.description == "Home" {
            delegate?.showSideMenuViewController(doFolding: true)
        }
        if sideMenuModel?.description == "Exercises" {
            presentVC(exercisesVC)
        }
        if sideMenuModel?.description == "Profile" {
            presentVC(profileVC)
        }
        if sideMenuModel?.description == "Coaches" {
            presentVC(coachesVC)
        }
        if sideMenuModel?.description == "About" {
            presentVC(mapVC)
        }
        
    }
    
    func presentVC(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        self.view.window!.layer.add(transition, forKey: kCATransition)

        present(viewControllerToPresent, animated: false)
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
