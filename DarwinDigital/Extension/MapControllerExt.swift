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
        print(view.annotation!.title as Any)
        let detail = DetailVC()
        //guard let annotation = view.annotation else { return }
        self.navigationController?.pushViewController(detail, animated: true)
        
        
    }
}
