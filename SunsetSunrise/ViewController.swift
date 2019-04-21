//
//  ViewController.swift
//  SunsetSunrise
//
//  Created by MJC-iCloud on 4/3/19.
//  Copyright © 2019 Matthew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sunriseLabel: UILabel!
    @IBOutlet var sunsetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let sunTimes = SunTimes(from: decoder)
        sunriseLabel.text = sunTimes.sunrise
        sunsetLabel.text = sunTimes.sunset
    }
}

