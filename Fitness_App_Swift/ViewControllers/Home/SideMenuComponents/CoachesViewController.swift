//
//  CoachesViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 16.12.2020.
//

import UIKit

class CoachesViewController: UIViewController {
    
    var tableView = UITableView()
    var coachesList: [Coaches] = []
    var currentIndex = 0
    var fm = FileManager.default
    var fresult: Bool = false
    var subUrl: URL?
    var mainUrl: URL? = Bundle.main.url(forResource: "coaches", withExtension: "json")
    
    
    
    @IBOutlet weak var coachesLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Coaches"
        getData()
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    func getData() {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            subUrl = documentDirectory.appendingPathComponent("coaches.json")
            loadFile(mainPath: mainUrl!, subPath: subUrl!)
        } catch {
            print(error)
        }
    }
    
    func loadFile(mainPath: URL, subPath: URL){
        if fm.fileExists(atPath: subPath.path){
            decodeData(pathName: subPath)
            
            if coachesList.isEmpty{
                decodeData(pathName: mainPath)
            }
            
        }else{
            decodeData(pathName: mainPath)
        }
        self.tableView.reloadData()
    }
    
    func decodeData(pathName: URL){
        do{
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            coachesList = try decoder.decode([Coaches].self, from: jsonData)
        } catch {}
    }
    
    func alertMessages (){
        let alert = UIAlertController(title: "Reminder:", message: "No Data has been changed!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return coachesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        coachesList.sort{$0.firstN < $1.firstN}
        
        cell.textLabel?.text = coachesList[indexPath.row].firstN + " " + coachesList[indexPath.row].lastN
        
        cell.textLabel?.textColor = UIColor.white
        
        cell.textLabel?.font = UIFont.Abel().regular(with: 20)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = indexPath.row
        performSegue(withIdentifier: "details", sender: self)
    }

}

