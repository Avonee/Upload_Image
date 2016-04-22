//
//  ViewController.swift
//  UploadImageTest
//
//  Created by rubl333 on 2016/4/20.
//  Copyright (c) 2016年 appcoda. All rights reserved.
//

import UIKit


func getDocumentsURL() -> NSURL {
    let documentsURL: AnyObject = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    return documentsURL as! NSURL
}

func fileInDocumentsDirectory(filename: String) -> String {
    
    let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
    return fileURL.path!
    
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var upload: UIButton!
    
    var imagePicker:UIImagePickerController!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Birthday: UITextField!
    
    @IBOutlet weak var Secret: UITextField!
    
    var userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Email.delegate = self
        Birthday.delegate = self
        Secret.delegate = self
    }
    
    func textFieldShouldReturn(Email: UITextField) -> Bool {
        Email.resignFirstResponder()
        Birthday.resignFirstResponder()
        Secret.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(Email: UITextField)
    {
        Email.becomeFirstResponder()
        Birthday.canBecomeFirstResponder()
        Secret.canBecomeFirstResponder()
        let frame: CGRect = Email.frame
        var offset: CGFloat = frame.origin.y-(self.view.frame.size.height-263)
        let animationDuration : NSTimeInterval = 0.30
        UIView.beginAnimations("ResizeForKeyboard", context: nil)
        UIView.setAnimationDuration(animationDuration)
        if(offset > 0) { self.view.frame = CGRectMake(0.0, -offset, self.view.frame.size.width, self.view.frame.size.height) }
        UIView.commitAnimations()
    }
    func textFieldDidEndEditing( Email: UITextField) {
        self.view.frame = CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height)
    }

    @IBAction func upload_open(sender: AnyObject) {
        imagePicker = UIImagePickerController()
        imagePicker.modalPresentationStyle = .CurrentContext
        imagePicker.sourceType = .PhotoLibrary
       // imagePicker.sourceType = .Camera
        
        //define Delegate
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            photo.image = image
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        
    }
    
    
    @IBOutlet weak var Submit: UIButton!
    
    @IBAction func Submit(sender: AnyObject) {
        
        if (Email.text == "") || (Birthday.text == "") || (Secret.text == "") {
            
            var alert = UIAlertController(title: "Error", message: "未填寫完畢！", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            
        }else{
        
        self.userDefault.setObject(self.Email.text, forKey: "User_ID")
        self.userDefault.setObject(self.Birthday.text, forKey: "User_Birthday")
        self.userDefault.setObject(self.Secret.text, forKey: "User_Secret")
        
        
        self.userDefault.synchronize()
            
            //////
            // Define the specific path, image name
            let myImageName = "sample.jpg"
            let imagePath = fileInDocumentsDirectory(myImageName)
            
            if let image = photo.image {
                saveImage(image, path: imagePath)
            } else { print("some error message") }
            
            
            
            //////
        
        self.performSegueWithIdentifier("toMain", sender: self)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func saveImage (image: UIImage, path: String ) -> Bool{
        
        // let pngImageData = UIImagePNGRepresentation(image)
        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = jpgImageData!.writeToFile(path, atomically: true)
        
        return result
        
    }
    
    
    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toMain"{
            let vc = segue.destinationViewController as! IntoViewController
//                vc.nameLabeltext = Email.text
//                vc.BigHeadimage = photo.image
        }
    }


}

