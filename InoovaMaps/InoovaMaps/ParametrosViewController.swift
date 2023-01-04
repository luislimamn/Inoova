//
//  ParametrosViewController.swift
//  InoovaMaps
//
//  Created by Luis Lima on 13/12/22.
//

import Foundation
import UIKit
import AVFoundation

class ParametrosViewController: UIViewController {
    
    var player = AVAudioPlayer()
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBAction func atualizarVolume(_ sender: Any) {
        //print(sliderVolume.value)
        player.volume = sliderVolume.value
    }
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let path = Bundle.main.path(forResource: "forrozaoCobranca", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            } catch  {
                print("Erro ao exercutar o som!")
            }
        }
        
        
    }
    

}
