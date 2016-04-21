//
//  LoginViewController.swift
//  
//
//  Created by rubl333 on 2016/4/20.
//
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Secret: UITextField!
    
    var userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func Login(sender: AnyObject) {
        
        if (Email.text == "") || (Secret.text == ""){
            
            var alert = UIAlertController(title: "Error", message: "未填寫完畢！", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }else{
            
            
        var names: String? = userDefault.objectForKey("User_ID") as! String?
        if names == nil{
            var alert = UIAlertController(title: "Error", message: "未註冊過喔！", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
        }else{
            self.performSegueWithIdentifier("Login_toMain", sender: self)
        }
        
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Login_toMain"{
            let vc = segue.destinationViewController as! IntoViewController
            
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
