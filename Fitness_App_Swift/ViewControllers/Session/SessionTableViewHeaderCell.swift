//
//  SessionTableViewHeader.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 29.11.2020.
//

import UIKit

class SessionTableViewHeaderCell: UITableViewCell {
    
    var logoImage = UIImageView()
    var logoText = UILabel()
//    var backButton = UIButton()
    var sessionName = UILabel()
    var coachText = UILabel()
    var coachName = UILabel()
    var timeText = UILabel()
    var timeNumbers = UILabel()
    var descriptionText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(logoImage)
        contentView.addSubview(logoText)
//        contentView.addSubview(backButton)
        contentView.addSubview(sessionName)
        contentView.addSubview(coachText)
        contentView.addSubview(coachName)
        contentView.addSubview(timeText)
        contentView.addSubview(timeNumbers)
        contentView.addSubview(descriptionText)
        
        configureLogoText()
        configureSessionName()
        configureCoachText()
        configureCoachName()
        configureTimeText()
        configureTimeNumbers()
        configureDescriptionText()
        
        setLogoImageConstraints()
        setLogoTextConstraints()
        setSessionNameConstraints()
        setCoachTextConstraints()
        setCoachNameConstraints()
        setTimeTextConstraints()
        setTimeNumbersConstraints()
        setDescriptionTextConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(exerciseHeader: ExerciseHeader) {
        logoImage.image = exerciseHeader.logoImg
        logoText.text = exerciseHeader.logoTxt
//        backButton.button = exerciseHeader.backBtn
        sessionName.text = exerciseHeader.sessionN
        coachText.text = exerciseHeader.coachTxt
        coachName.text = exerciseHeader.coachN
        timeText.text = exerciseHeader.timeTxt
        timeNumbers.text = exerciseHeader.timeNum
        descriptionText.text = exerciseHeader.descriptionTxt
    }

    
    func configureLogoText() {
        logoText.font = UIFont(name: "Helvetica Light", size: 9.0)
    }
    func configureSessionName() {
        sessionName.font = UIFont.Abel().bold(with: 31)
    }
    func configureCoachText() {
        coachText.font = UIFont.Abel().bold(with: 24)
    }
    func configureCoachName() {
        coachText.font = UIFont.Abel().regular(with: 24)
    }
    func configureTimeText() {
        coachText.font = UIFont.Abel().bold(with: 24)
    }
    func configureTimeNumbers() {
        coachText.font = UIFont.Abel().regular(with: 24)
    }
    func configureDescriptionText() {
        descriptionText.font = UIFont.Abel().regular(with: 20)
    }
    
    func setLogoImageConstraints() {
        logoImage.translatesAutoresizingMaskIntoConstraints                                                         = false
        logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 62).isActive                       = true
        logoImage.bottomAnchor.constraint(equalTo: logoText.topAnchor, constant: -10).isActive                      = true
        logoImage.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive                     = true
    }
    func setLogoTextConstraints() {
        logoText.translatesAutoresizingMaskIntoConstraints                                                          = false
        logoText.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 0).isActive                        = true
        logoText.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive                      = true
    }
    func setSessionNameConstraints() {
        sessionName.translatesAutoresizingMaskIntoConstraints                                                       = false
        sessionName.topAnchor.constraint(equalTo: logoText.bottomAnchor, constant: 30).isActive                     = true
        sessionName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive                   = true
        sessionName.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 16).isActive                 = true
    }
    func setCoachTextConstraints() {
        coachText.translatesAutoresizingMaskIntoConstraints                                                         = false
        coachText.topAnchor.constraint(equalTo: sessionName.bottomAnchor, constant: 70).isActive                    = true
        coachText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive                     = true
    }
    func setCoachNameConstraints() {
        coachName.translatesAutoresizingMaskIntoConstraints                                                         = false
        coachName.topAnchor.constraint(equalTo: sessionName.bottomAnchor, constant: 70).isActive                    = true
        coachName.leftAnchor.constraint(equalTo: coachText.leftAnchor, constant: 8).isActive                        = true
    }
    func setTimeTextConstraints() {
        timeText.translatesAutoresizingMaskIntoConstraints                                                          = false
        timeText.topAnchor.constraint(equalTo: sessionName.bottomAnchor, constant: 70).isActive                     = true
        timeText.leftAnchor.constraint(equalTo: coachText.leftAnchor, constant: 85).isActive                        = true
    }
    func setTimeNumbersConstraints() {
        timeNumbers.translatesAutoresizingMaskIntoConstraints                                                       = false
        timeNumbers.topAnchor.constraint(equalTo: sessionName.bottomAnchor, constant: 70).isActive                  = true
        timeNumbers.leftAnchor.constraint(equalTo: timeText.leftAnchor, constant: 8).isActive                       = true
    }
    func setDescriptionTextConstraints() {
        descriptionText.translatesAutoresizingMaskIntoConstraints                                                   = false
        descriptionText.topAnchor.constraint(equalTo: coachText.bottomAnchor, constant: 40).isActive                = true
        descriptionText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive               = true
        descriptionText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 40).isActive           = true
        descriptionText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 16).isActive             = true
    }
    
}
