//
//  CoachesViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 16.12.2020.
//

import UIKit

class CoachesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var coachesLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var coachTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [Coach] = []
    let databaseService: Database = CoreDataService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Coaches"
        setupDataSource()
        setupTableView()
    }
    
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupDataSource() {
        dataSource = databaseService.fetchObjects(of: Coach.self,
                                                  sortDescriptor: Sorted(key: "age", ascending: false),
                                                  predicate: NSPredicate(format: "age > 20"))
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
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let fName = coachTextField.text, !fName.isEmpty else {
            return
        }
        
        guard let newCoach = databaseService.create(type: Coach.self) else {
            return
        }
        
        newCoach.fName = fName
        newCoach.age = Int16.random(in: 18...35)
        
        databaseService.saveChanges()
        dataSource.append(newCoach)
        tableView.reloadData()
        
        coachTextField.text = nil
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellId")
        let coach = dataSource[indexPath.row]
        cell.textLabel?.text = coach.fName
        
        let starsTextPart = coach.age == 1 ? "year old" : "years old"
        cell.detailTextLabel?.text = "Age: \(coach.age) \(starsTextPart)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            databaseService.delete(dataSource[indexPath.row])
            dataSource.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

}
