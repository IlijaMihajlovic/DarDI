//
//  MapControllerExt.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/13/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import MapKit

extension MapController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
 
       guard let annotation = view.annotation else { return }
        print(String(describing: annotation.title))
        
       
        //guard let userAnnotation = view.annotation as? JSONGeoModelData else {return}
        
        self.navigationController?.pushViewController(DetailVC.shared, animated: true)
        
        
    }
}
