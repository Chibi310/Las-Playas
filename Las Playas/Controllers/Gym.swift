//
//  Gym.swift
//  Las Playas
//
//  Created by Christopher Medina on 3/8/22.
//

import UIKit




//@IBOutlet weak var q2Value: UILabel!
//@IBOutlet weak var q1Value: UILabel!
//@IBOutlet weak var q3Value: UILabel!
//@IBOutlet weak var commentBox: UITextView!

class Gym : UIViewController {

    @IBOutlet weak var q1Value: UILabel!
    @IBOutlet weak var q2Value: UILabel!
    @IBOutlet weak var q3Value: UILabel!
    @IBOutlet weak var commentBox: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func q1Slider(_ sender: UISlider) {
            
        let userRating = Int(sender.value)
        q1Value.text = "\(userRating)" + "%"
                
        }
        
    @IBAction func q2Value(_ sender: UISlider) {
            
        let userRating = Int(sender.value)
        q2Value.text = "\(userRating)" + "%"
            
        }
        
    @IBAction func q3Value(_ sender: UISlider) {
            
        let userRating = Int(sender.value)
        q3Value.text = "\(userRating)" + "%"
            
        }
        
    @IBAction func submitComments(_ sender: Any) {
        
        DBSource.instance.addData(q1: q1Value.text!, q2: q2Value.text!, q3: q3Value.text!, com: commentBox.text!)
        
        self.dismiss(animated: true, completion: nil)
        }
        
    }

