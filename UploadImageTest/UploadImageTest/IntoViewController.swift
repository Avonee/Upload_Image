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
            
//            if BigHeadimage != nil{
//            BigHead.image = BigHeadimage
//            }
//        }
        
        let myImageName = "sample.jpg"
        let imagePath = fileInDocumentsDirectory(myImageName)
        if let loadedImage = loadImageFromPath(imagePath) {
            print(" Loaded Image: \(loadedImage)")
            BigHead.image = loadedImage
        } else { print("some error message 2") }
      }
        BigHead.layer.cornerRadius = BigHead.frame.size.width/2
        BigHead.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImageFromPath(path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
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
