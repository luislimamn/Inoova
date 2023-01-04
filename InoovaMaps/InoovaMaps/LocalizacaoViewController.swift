//
//  LocalizacaoViewController.swift
//  InoovaMaps
//
//  Created by Luis Lima on 13/12/22.
//

import Foundation
import UIKit
import MapKit

class LocalizacaoViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapaLocalizacao: MKMapView!
    var gerenciardorLocalizacao = CLLocationManager()
    @IBOutlet weak var velocidadeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gerenciardorLocalizacao.delegate = self
        gerenciardorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciardorLocalizacao.requestWhenInUseAuthorization()
        gerenciardorLocalizacao.startUpdatingLocation()
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //print(locations)
        //print(locations)
        //Lat: -3.7773956
        //Log: -38.5331911
        
        let localizacaoUsuario: CLLocation = locations.last!
        
        let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longitude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude
        let deltaLatitude: CLLocationDegrees = 0.01
        let deltaLongitude: CLLocationDegrees = 0.01
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: areaVisualizacao)
        
        if localizacaoUsuario.speed > 0 {
            //let texto = "Lat:" + String(latitude)
            velocidadeLabel.text = String( localizacaoUsuario.speed )
            latitudeLabel.text = "Lat:" + String(latitude)
            longitudeLabel.text = "Log:" + String(longitude)
        }
        
        mapaLocalizacao.setRegion(regiao, animated: true)
        
    }

}
