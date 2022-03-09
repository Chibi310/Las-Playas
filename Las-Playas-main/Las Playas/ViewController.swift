//
//  ViewController.swift
//  Las Playas
//
//  Created by Christopher Medina on 2/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SignIn(_ sender: Any)
    {
        
        let check: DBD? = DBSource.instance.CheckUserData(UserName.text!);
        
        if let unwrapped = check
        {
           print("User Found:", String(unwrapped.userName!), "\nPassword:", String(unwrapped.password!));
            if(nil != Password.text)
            {
                if(unwrapped.password == Password.text!)
                {
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
    
    @IBAction func RegScrn()
    {
        let RC = storyboard?.instantiateViewController(identifier: "Register_Screen") as! RegScreen;
        
        present(RC, animated: true);
    }
}

