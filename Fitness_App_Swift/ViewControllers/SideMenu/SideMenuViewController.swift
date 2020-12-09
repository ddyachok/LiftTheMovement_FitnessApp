//
//  SideMenuViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 07.12.2020.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    var sideMenuItemsTableV: UITableView!

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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sideMenuItemsTableV.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.reuseId) as! SideMenuTableViewCell
        let sideMenuModel = SideMenuModel(rawValue: indexPath.row)
        cell.menuLabel.text = sideMenuModel?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
