//
//  ViewController.swift
//  UploadImageTest
//
//  Created by rubl333 on 2016/4/20.
//  Copyright (c) 2016年 appcoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var upload: UIButton!
    
    var imagePicker:UIImagePickerController!
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Birthday: UITextField!
    
    @IBOutlet weak var Secret: UITextField!
    
    
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
        
        self.performSegueWithIdentifier("toMain", sender: self)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toMain"{
            let vc = segue.destinationViewController as! IntoViewController
                vc.nameLabeltext = Email.text
                vc.BigHeadimage = photo.image
        }
    }


}

