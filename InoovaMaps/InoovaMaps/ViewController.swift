//
//  ViewController.swift
//  InoovaMaps
//
//  Created by Luis Lima on 13/12/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        Fortaleza Airport
        -3.7773956,-38.5331911

        Congonhas Airport
        -23.6234734,-46.6614349
        GRU Airport
        -23.4251297,-46.4745532

        Foz de Iguaçu Airport
        -25.6043449,-54.4918155
        */
        
        let latitude: CLLocationDegrees = -3.7773956
        let longitude: CLLocationDegrees = -38.5331911
        let deltaLatitude: CLLocationDegrees = 0.05
        let deltaLongitude: CLLocationDegrees = 0.05
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: areaVisualizacao)
        
        mapa.setRegion(regiao, animated: true)
        
        let anotacao = MKPointAnnotation()
        
        //cofiguracao
        anotacao.coordinate = localizacao
        anotacao.title = "Aeroporto de Fortaleza"
        anotacao.subtitle = "Aeroporto Internacional Pinto Martins"
        
        mapa.addAnnotation(anotacao)
        
    }


}

