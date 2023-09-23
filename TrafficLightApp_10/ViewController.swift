//
//  ViewController.swift
//  TrafficLightApp_10
//
//  Created by Andrey Kovalev on 24.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLightIndex = 0
    private var lights: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        redLight.layer.cornerRadius = 60
        yellowLight.layer.cornerRadius = 60
        greenLight.layer.cornerRadius = 60
        startButton.layer.cornerRadius = 15
        
        redLight.alpha = 0.0
        yellowLight.alpha = 0.0
        greenLight.alpha = 0.0

        lights = [redLight, yellowLight, greenLight]
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        lights[currentLightIndex].alpha = 1.0
        if currentLightIndex > 0 {
            lights[currentLightIndex - 1].alpha = 0.3
        } else if currentLightIndex == 0 && sender.currentTitle == "NEXT" {
           
            lights[lights.count - 1].alpha = 0.3
        }

        sender.setTitle("NEXT", for: .normal)

        currentLightIndex = (currentLightIndex + 1) % lights.count
    }
}
