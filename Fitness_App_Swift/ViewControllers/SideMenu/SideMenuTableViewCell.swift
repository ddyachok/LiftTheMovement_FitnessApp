//
//  SideMenuTableViewCell.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 08.12.2020.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    static let reuseId = "SideMenuTableViewCell"
    
    let menuLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SOME TEXT"
        label.font = UIFont.Abel().regular(with: 21)
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(menuLabel)
        
        // iconImageView constraints
        menuLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        menuLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        menuLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
