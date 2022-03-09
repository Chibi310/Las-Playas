//
//  RegScreen.swift
//  Las Playas
//
//  Created by Christopher Medina on 3/8/22.
//

import UIKit

class RegScreen: UIViewController {

    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func RegisterNewUser(_ sender: Any)
    {
        DBSource.instance.RegUser(UserName.text!, Password.text!);
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func CancelRegistration()
    {
        self.dismiss(animated: true, completion: nil);
    }
    
}
