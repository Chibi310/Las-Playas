//
//  Settings.swift
//  Las Playas
//
//  Created by Christopher Medina on 3/8/22.
//

import UIKit

class Settings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func BackButton()
    {
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func Logout()
    {
        UserData.userInfo = ""
        UserData.tallyScore = [:]
        let WC = storyboard?.instantiateViewController(identifier: "Welcome") as! ViewController;
        present(WC, animated: true);
    }
}
