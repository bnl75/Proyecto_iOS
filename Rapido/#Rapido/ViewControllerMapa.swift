//
//  ViewControllerMapa.swift
//  #Rapido
//
//  Created by Laboratorio UNAM-Apple 01 on 08/11/19.
//  Copyright © 2019 ari. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerMapa: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapViewContactos: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var pointsAnnotation : [MKPointAnnotation] =  [MKPointAnnotation]()
        
        mapViewContactos.mapType = .standard
        
        let location = CLLocationCoordinate2DMake(19.38000179054191, -99.13869341582512)
        let span = MKCoordinateSpan.init(latitudeDelta: 0.00300, longitudeDelta: 0.00700)
        let region = MKCoordinateRegion(center: location, span: span)
        mapViewContactos.setRegion(region, animated: true)
        
        pointsAnnotation.append(MKPointAnnotation())
        pointsAnnotation.append(MKPointAnnotation())
        pointsAnnotation.append(MKPointAnnotation())
        pointsAnnotation.append(MKPointAnnotation())
        pointsAnnotation.append(MKPointAnnotation())
        pointsAnnotation.append(MKPointAnnotation())

        
        pointsAnnotation[0].coordinate = CLLocationCoordinate2DMake(19.38000179054191 ,-99.13869341582512)
        pointsAnnotation[0].title = "Tintorería Clean Max"
        pointsAnnotation[0].subtitle = "5527475087"
        
        pointsAnnotation[1].coordinate = CLLocationCoordinate2DMake(19.380169233699164, -99.13741125285497)
        pointsAnnotation[1].title = "Farmacia San Diego"
        pointsAnnotation[1].subtitle = "36787654"
        
        pointsAnnotation[2].coordinate = CLLocationCoordinate2DMake(19.363348995753654, -99.14015820260833)
        pointsAnnotation[2].title = "La Corona"
        pointsAnnotation[2].subtitle = "5587235630"
        
        pointsAnnotation[3].coordinate = CLLocationCoordinate2DMake(19.378378584193655, -99.13821371416978)
        pointsAnnotation[3].title = "Veterinaria San Patricio"
        pointsAnnotation[3].subtitle = "47893247"
        
        pointsAnnotation[4].coordinate = CLLocationCoordinate2DMake(19.37300200587792, -99.14611362422423)
        pointsAnnotation[4].title = "Las casuelas de Chepina"
        pointsAnnotation[4].subtitle = "67435908"
        
        pointsAnnotation[5].coordinate = CLLocationCoordinate2DMake(19.37245729487634, -99.14108359105988)
        pointsAnnotation[5].title = "Papeleria DABO"
        pointsAnnotation[5].subtitle = "63234506"
        
        mapViewContactos.addAnnotations(pointsAnnotation)
        
        locationManager.delegate = self 
        
        if CLLocationManager.locationServicesEnabled(){
            checkLocationAuthorization()
        }
        
    }
    
    func checkLocationAuthorization(){
        
        switch CLLocationManager.authorizationStatus(){
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse:
            mapViewContactos.showsUserLocation = true //Activar o desactivar punto de ubicación
            //centerViewOnUserLocation() //Lo quito para que el mapa se abra en los pines establecidos
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            break
        case .authorizedAlways:
            //Aqui no hago nada
            break
        case .denied:
            //El gacho no e dio permisos para espiarlo
            break
        case .restricted:
            //Sigue siendo gacho
            break
        }
    }
    
    func centerViewOnUserLocation (){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100_000, longitudinalMeters: 100_000)
            mapViewContactos.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
