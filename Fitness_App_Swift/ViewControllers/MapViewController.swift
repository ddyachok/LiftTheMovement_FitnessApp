//
//  MapViewController.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 13.12.2020.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var mapWindow: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMap()
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
    
    func configureMap() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.52426714691311, longitude: -0.07889223058525051)
        annotation.title = "Lift: The Movement"
        mapWindow.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 7500, longitudinalMeters: 7500)
        mapWindow.setRegion(region, animated: true)
    }
    
}
