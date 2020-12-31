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
    @IBOutlet weak var gearImageView: UIImageView!
    @IBOutlet weak var backpackImageVIew: UIImageView!
    
    var gearViewOrigin: CGPoint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMap()
        addPanGesture(view: gearImageView)
        gearViewOrigin = gearImageView.frame.origin
        view.bringSubviewToFront(gearImageView)
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
    
    
// MARK: Pan gesture
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(MapViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        
        let gearView = sender.view!
        
        switch sender.state {
        case .began, .changed:
            moveViewWithPan(view: gearView, sender: sender)
        case .ended:
            if gearView.frame.intersects(backpackImageVIew.frame) {
                hideView(view: gearView)
            }
            else {
                returnViewToOrigin(view: gearView)
            }
        default:
            break
        }
    }
    
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    func returnViewToOrigin(view: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            view.frame.origin = self.gearViewOrigin
        })
    }
    
    func hideView(view: UIView) {
        UIView.animate(withDuration: 0.3, animations: {
            view.alpha = 0.0
        })
    }
}
