//
//  ViewController.swift
//  randomImage
//
//  Created by poti on 2020/04/11.
//  Copyright © 2020 kaoru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        
        stopButton.isEnabled = false
        
        for i in 0..<5{
            
            print(i)
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
            //! is cant allow nil
        }
        
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer(){
        //roulet & timer
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    //this func called every 0.2sec
    @objc func timerUpdate(){
        count = count + 1
        
        if count > 4{
            count = 0
        }
        
        imageView.image = imageArray[count]
    }
    
    @IBAction func start(_ sender: Any) {
        startTimer()
        startButton.isEnabled = false
        stopButton.isEnabled  = true
    }
    
    @IBAction func stop(_ sender: Any) {
        //タイマーを止める
        timer.invalidate()
        startButton.isEnabled = true
        stopButton.isEnabled  = false
        
        count = 0
    }
}

