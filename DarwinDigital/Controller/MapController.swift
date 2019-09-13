//
//  MapController.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/12/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Map"
        configureMapView()
        checkJSONDataGeoDataForPossibleErrors()
    }
    
    
    fileprivate func checkJSONDataGeoDataForPossibleErrors() {
        guard let urlString = URL(string: HomeController.shared.url) else { return }
        
        HomeController.shared.fetchJSON(url: urlString) {(result) in
            
            switch result {
            case .success(let jsonData):
                jsonData.forEach({ (data) in
                    //print("Success: \(data.address.geo.lat), \(data.address.geo.lng), \(data.address.city)")
                    
                    let Latitude = Double(data.address.geo.lat)!
                    let Longitude = Double(data.address.geo.lng)!
                    let location = CLLocationCoordinate2D(latitude: Latitude, longitude: Longitude)
                    let pin = JSONGeoModelData(title: data.username, coordinate: location, subtitle: data.address.city)
                    
                    DispatchQueue.main.async {
                        self.mapView.addAnnotation(pin)
                    }
                    self.mapView.addAnnotation(pin)
                })
                
            case .failure(let err):
                print("Failed:", err)
            }
        }
    }
    
    func configureMapView() {
        mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.userTrackingMode = .follow
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation!.title as Any)
       let detail = DetailVC()
        //guard let annotation = view.annotation else { return }
        self.navigationController?.pushViewController(detail, animated: true)
        
        
    }
    
}










