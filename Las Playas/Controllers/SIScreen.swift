//
//  SIScreen.swift
//  Las Playas
//
//  Created by Christopher Medina on 3/9/22.
//

import UIKit

class SIScreen: UIViewController {

    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UserName.layer.cornerRadius = 30.0;
        UserName.layer.borderWidth = 2.0;
        UserName.layer.borderColor = UIColor.white.cgColor;
        UserName.layer.backgroundColor = UIColor.white.cgColor;
        Password.layer.cornerRadius = 30.0;
        Password.layer.borderWidth = 2.0;
        Password.layer.borderColor = UIColor.white.cgColor;
        Password.layer.backgroundColor = UIColor.white.cgColor;
    }
    
    @IBAction func Signin()
    {
        let check: DBD? = DBSource.instance.CheckUserData(UserName.text!);
        
        if let unwrapped = check
        {
           print("User Found:", String(unwrapped.userName!), "\nPassword:", String(unwrapped.password!));
            if(nil != Password.text)
            {
                if(unwrapped.password == Password.text!)
                {
                    UserData.userInfo = UserName.text!
                    if unwrapped.q1Rating == nil {
                        UserData.userScore = ""
                    } else {
                        UserData.userScore = unwrapped.q1Rating!
                      }
                    
                    if unwrapped.feedback == nil {
                        UserData.userFeedback = ""
                    } else {
                        UserData.userFeedback = unwrapped.feedback!
                      }
        
                    let RC = storyboard?.instantiateViewController(identifier: "Main_Menu") as! CentralMenu;
                    present(RC, animated: true);
                }
                else
                {
                    print("Password Does Not Match...");
                }
            }
        }
        else
        {
            print("User not found...");
        }
    }
    
    @IBAction func Cencel()
    {
        self.dismiss(animated: true, completion: nil);
    }
}
