//
//  SessionTableViewCell.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 11.11.2020.
//

import UIKit

class SessionTableViewCell: UITableViewCell {
    
    var exerciseNumber = UILabel()
    var exerciseImageView_1 = UIImageView()
    var exerciseImageView_2 = UIImageView()
    var bodyPlacement = UILabel()
    var bodyPlacementText = UILabel()
    var movement = UILabel()
    var movementText = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(exerciseNumber)
        contentView.addSubview(exerciseImageView_1)
        contentView.addSubview(exerciseImageView_2)
        contentView.addSubview(bodyPlacement)
        contentView.addSubview(bodyPlacementText)
        contentView.addSubview(movement)
        contentView.addSubview(movementText)
        
        configureExerciseNumber()
        configureBodyPlacement()
        configureBodyPlacementText()
        configureMovement()
        configureMovementText()
        
        setExerciseNumberConstraints()
        setExerciseImageView_1Constraints()
        setExerciseImageView_2Constraints()
        setBodyPlacementConstraints()
        setBodyPlacementTextConstraints()
        setMovementConstraint()
        setMovementTextConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(exercise: Exercise) {
        exerciseNumber.text = exercise.exerciseNum
        exerciseImageView_1.image = exercise.image1
        exerciseImageView_2.image = exercise.image2
        bodyPlacement.text = exercise.bodyPl
        bodyPlacementText.text = exercise.bodyPlTxt
        movement.text = exercise.movement
        movementText.text = exercise.movementTxt
    }
    
    func configureExerciseNumber() {
        exerciseNumber.font = UIFont(name: "AbelPro-Bold", size: 31)
    }
    
    func configureBodyPlacement() {
        bodyPlacement.font = UIFont(name: "AbelPro-Bold", size: 20)
    }
    
    func configureBodyPlacementText() {
        bodyPlacementText.numberOfLines = 0
        bodyPlacementText.font = UIFont(name: "Abel-Regular", size: 20)
    }
    
    func configureMovement() {
        movement.font = UIFont(name: "AbelPro-Bold", size: 20)
    }
    
    func configureMovementText() {
        movementText.numberOfLines = 0
        movementText.font = UIFont(name: "Abel-Regular", size: 20)
    }
    
    
    func setExerciseNumberConstraints() {
        exerciseNumber.translatesAutoresizingMaskIntoConstraints                                                      = false
        exerciseNumber.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive                    = true
        exerciseNumber.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive                  = true
        exerciseNumber.bottomAnchor.constraint(equalTo: exerciseImageView_1.topAnchor, constant: -40).isActive        = true
        exerciseNumber.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 16).isActive                = true
    }
    
    func setExerciseImageView_1Constraints() {
        exerciseImageView_1.translatesAutoresizingMaskIntoConstraints                                                 = false
        exerciseImageView_1.topAnchor.constraint(equalTo: exerciseNumber.bottomAnchor, constant: 40).isActive         = true
        exerciseImageView_1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14).isActive                   = true
        exerciseImageView_1.heightAnchor.constraint(equalToConstant: 185).isActive                                    = true
        exerciseImageView_1.widthAnchor.constraint(equalToConstant: 185).isActive                                     = true
    }
    
    func setExerciseImageView_2Constraints() {
        exerciseImageView_2.translatesAutoresizingMaskIntoConstraints                                                 = false
        exerciseImageView_2.topAnchor.constraint(equalTo: exerciseNumber.bottomAnchor, constant: 40).isActive         = true
        exerciseImageView_2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14).isActive                = true
        exerciseImageView_2.heightAnchor.constraint(equalToConstant: 185).isActive                                    = true
        exerciseImageView_2.widthAnchor.constraint(equalToConstant: 185).isActive                                     = true
    }
    
    func setBodyPlacementConstraints() {
        bodyPlacement.translatesAutoresizingMaskIntoConstraints                                                       = false
        bodyPlacement.topAnchor.constraint(equalTo: exerciseImageView_1.bottomAnchor, constant: 40).isActive          = true
        bodyPlacement.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive                   = true
    }
    
    func setBodyPlacementTextConstraints() {
        bodyPlacementText.translatesAutoresizingMaskIntoConstraints                                                   = false
        bodyPlacementText.topAnchor.constraint(equalTo: bodyPlacement.bottomAnchor, constant: 20).isActive            = true
        bodyPlacementText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive               = true
        bodyPlacementText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive            = true
    }
    
    func setMovementConstraint() {
        movement.translatesAutoresizingMaskIntoConstraints                                                            = false
        movement.topAnchor.constraint(equalTo: bodyPlacementText.bottomAnchor, constant: 40).isActive                 = true
        movement.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive                        = true
    }
    
    func setMovementTextConstraint() {
        movementText.translatesAutoresizingMaskIntoConstraints                                                        = false
        movementText.topAnchor.constraint(equalTo: movement.bottomAnchor, constant: 20).isActive                      = true
        movementText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive                    = true
        movementText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive                 = true
        movementText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive                = true
    }
    
}
