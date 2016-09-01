//
//  SlideViewController.swift
//  SlideShowApp2
//
//  Created by Taro Sakamoto on 8/30/16.
//  Copyright © 2016 Tarou Sakamoto. All rights reserved.
//

import UIKit

protocol SlideViewControllerDelegate: class {
    func setSlideImage(displayImageNum: Int)
}

class SlideViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    
    
    weak var delegate: SlideViewControllerDelegate? = nil
    var displayImageNum:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage.init(named: displayImageNum.description + ".jpg")
       imageview.image = image
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushbackbutton(sender: AnyObject) {
    self.delegate?.setSlideImage(self.displayImageNum)
    self.dismissViewControllerAnimated(true) {
    }
    
    }
    
    

    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
