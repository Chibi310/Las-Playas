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
        
        let RC = storyboard?.instantiateViewController(identifier: "Signin_Screen") as! SIScreen;
        
        present(RC, animated: true);
    }
    
    @IBAction func RegScrn()
    {
        let RC = storyboard?.instantiateViewController(identifier: "Register_Screen") as! RegScreen;
        
        present(RC, animated: true);
    }
}

