//
//  CentralMenu.swift
//  Las Playas
//
//  Created by Christopher Medina on 3/8/22.
//

import UIKit

class CentralMenu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Room_Menu()
    {
        let RC = storyboard?.instantiateViewController(identifier: "Room_Menu") as! Room;
        
        present(RC, animated: true);
    }
    
    @IBAction func Gym_Menu()
    {
        let RC = storyboard?.instantiateViewController(identifier: "Gym_Menu") as! Gym;
        
        present(RC, animated: true);
    }
    
    @IBAction func Food_Menu()
    {
        let RC = storyboard?.instantiateViewController(identifier: "Food_Menu") as! Food;
        
        present(RC, animated: true);
    }
    
    @IBAction func Settings_Menu()
    {
        let RC = storyboard?.instantiateViewController(identifier: "Settings_Menu") as! Settings;
        
        present(RC, animated: true);
    }
    
    @IBAction func Game_Menu()
    {
        let RC = storyboard?.instantiateViewController(identifier: "Game_Menu") as! Game;
        
        present(RC, animated: true);
    }
    
    @IBAction func Overall_Feedback_Menu()
    {
        let RC = storyboard?.instantiateViewController(identifier: "Overall_Feedback") as! Feedback;
        
        present(RC, animated: true);
    }
}
