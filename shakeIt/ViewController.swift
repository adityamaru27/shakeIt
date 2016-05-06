//
//  ViewController.swift
//  shakeIt
//
//  Created by Aditya Maru on 2016-04-24.
//  Copyright © 2016 Aditya Maru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var sounds = ["pew", "pig", "snore", "static", "uuu"]
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?)
    {
        if event!.subtype == UIEventSubtype.MotionShake
        {
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            var error: NSError? = nil
            
            let filePath = NSBundle.mainBundle().pathForResource(sounds[randomNumber],
                                                                 ofType: "mp3")
           
            do
            {
                try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: filePath!))
                    
                    player.play()
                    
                }
            catch {}
            }
        }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}




