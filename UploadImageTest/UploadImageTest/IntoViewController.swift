//
//  IntoViewController.swift
//  
//
//  Created by rubl333 on 2016/4/21.
//
//

import UIKit

class IntoViewController: UIViewController {

    @IBOutlet weak var BigHead: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
   // var nameLabeltext = ""
    var BigHeadimage:UIImage!
    var userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var names: String? = userDefault.objectForKey("User_ID") as! String?
        if names == nil{
            
            nameLabel.text = "Hellow guys!"
            BigHead.image = UIImage(named:"swift_wallpaper.jpg")
        }else{
            //nameLabel.text = nameLabeltext
            nameLabel.text = names
            
            if BigHeadimage != nil{
            BigHead.image = BigHeadimage
            }
        }
        
        BigHead.layer.cornerRadius = BigHead.frame.size.width/2
        BigHead.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
