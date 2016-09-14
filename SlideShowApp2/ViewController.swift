//
//  ViewController.swift
//  SlideShowApp2
//
//  Created by Taro Sakamoto on 8/29/16.
//  Copyright © 2016 Tarou Sakamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
SlideViewControllerDelegate{
    
    
    let ImageMaxCount = 3
    
    let Delay = 2.0
    
    let ButtonPlayText = ">"
    let ButtonStopText = "||"
    
    
    @IBOutlet weak var imageview: UIImageView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var playButton: UIButton!
    
    var displayimageNum:Int = 1;
    var isPlay = false
    
    //Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showimage()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func showimage(){
        
        
        let image = UIImage.init(named:displayimageNum.description + ".jpg")
        imageview.image = image
    }
    
    func slideshow(){
        if isPlay == false {
            return
        }
        
        
        
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(Delay * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            
            
            if self.isPlay == false {
                return
            }
            

            
            if self.displayimageNum == self.ImageMaxCount {
                self.displayimageNum = 1
            } else {
                self.displayimageNum += 1
            }
            self.showimage()
            self.slideshow()
        }
    }
    //次へボタン
    
    @IBAction func pushnextButton(sender: AnyObject) {
        if isPlay == true {
            return
        }
        
        if displayimageNum == ImageMaxCount { displayimageNum = 1
        }else
        { displayimageNum += 1
            
        }
        showimage()
    }
    //戻るボタン
    
    @IBAction func pushbackButton(sender: AnyObject) {
        
        if isPlay == true{
            return
        }
        if displayimageNum == 1 {
            
            displayimageNum = ImageMaxCount
        } else {
            displayimageNum -= 1
        }
      showimage()
    }
    

    
    
    @IBAction func pushimageButton(sender: AnyObject) {
        self.performSegueWithIdentifier("segueSlideView",sender: self)
    }
    
    //ボタン 再生
    @IBAction func pushplayButton(sender: AnyObject) {
        
        isPlay = !isPlay
        nextButton.enabled = !isPlay
        backButton.enabled = !isPlay
        
        if isPlay == true {
            //再生
            playButton.setTitle(ButtonStopText,
                                forState:UIControlState.Normal)
            slideshow()
        }else{
            //停止
            playButton.setTitle(ButtonPlayText,
                                forState :UIControlState.Normal)
            
        }
        
    }
    
    //segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let slide:SlideViewController = segue.destinationViewController as! SlideViewController
        slide.displayImageNum = displayimageNum
        slide.delegate = self
    }
    
    // MARK: - SlideDetailViewControllerDelegate
    
    func setSlideImage(displayImageNum: Int) {
        self.displayimageNum = displayImageNum
        showimage()
    }
}


