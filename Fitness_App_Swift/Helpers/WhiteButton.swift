//
//  WhiteButton.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 14.10.2020.
//

import Foundation
import UIKit

class WhiteButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func styleWhiteButton() {
        setTitleColor(.black, for: .normal)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
    }
    
    func setupButton()  {
        
    }
    
    //TODO
    func invertColors() {
       
    }
    
}
