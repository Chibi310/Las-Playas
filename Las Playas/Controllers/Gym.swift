//
//  Gym.swift
//  Las Playas
//
//  Created by Christopher Medina on 3/8/22.
//

import UIKit

class Gym : UIViewController {
    
    @IBOutlet weak var gymTableView: UITableView!
    
    
    var tallyScore : [String : Int] = [:]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        gymTableView.delegate = self
        gymTableView.dataSource = self
        gymTableView.register(UINib(nibName: g.gymNibName, bundle: nil), forCellReuseIdentifier: g.gymCellIdentifier)
        
    }
    
    @IBAction func submitGymResponse(_ sender: Any) {
        
        var scoreArray = [Int](repeating: 0, count: g.gQuestions.count)
        var tallyArray : [String : [Int]] = ["Gym": scoreArray]
        
        for key in UserData.tallyScore.keys {
            tallyArray["Gym"]![Int(key)!] = UserData.tallyScore[key]!
            
        }
        
        print(tallyArray)
        self.dismiss(animated: true, completion: nil);
    }
    
    func showAlertDialog(dtype: String, msg: String, style: String, controller: String) {
        
        var dialogMessage = UIAlertController()
        var ok = UIAlertAction()
        
        switch style.lowercased() {
            case "alert":
                dialogMessage = UIAlertController(title: dtype, message: msg, preferredStyle: .alert)
                //ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in})
                ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                    if controller != "" {
                        self.goToNextController(segueId: controller)
                    }
                })
                dialogMessage.addAction(ok)
            default:
                print("No alert available")
        }
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func goToNextController(segueId: String) {
        
        performSegue(withIdentifier: segueId, sender: nil)
        
    }
    
}
    
extension Gym: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        switch section {
            
            case 0:
                    //print("ROWS: ",r.questions.count * 2)
                    //return r.questions.count + 1
                return min(g.gQuestions.count, 15)
            default:
                return 0
                
            }
            
        }
    //
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            switch indexPath.section {
                
                case 0:
                
                    let cell = tableView.dequeueReusableCell(withIdentifier: g.gymCellIdentifier, for: indexPath) as! GymTableViewCell
                    
                    cell.question.text = g.gQuestions[indexPath.row]
                    let qNum = indexPath.row
                    cell.fRateImage1.accessibilityIdentifier = String(qNum)+"-1"
                    cell.fRateImage2.accessibilityIdentifier = String(qNum)+"-2"
                    cell.fRateImage3.accessibilityIdentifier = String(qNum)+"-3"
                    cell.fRateImage4.accessibilityIdentifier = String(qNum)+"-4"
                    cell.fRateImage5.accessibilityIdentifier = String(qNum)+"-5"
                    cell.fRateImage1.alpha = 0.3
                    cell.fRateImage2.alpha = 0.3
                    cell.fRateImage3.alpha = 0.3
                    cell.fRateImage4.alpha = 0.3
                    cell.fRateImage5.alpha = 0.3
                
                    return cell
                    
                default:
                    let defCell = tableView.dequeueReusableCell(withIdentifier: g.gymCellIdentifier, for: indexPath)
                    print("no default")
                    return defCell
                
            }
            
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            
            return 1
            
        }
        
    

}
extension Gym: UITableViewDelegate {
        
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
            if UserData.tallyScore.count != 0 {
                for key in UserData.tallyScore.keys{
                    let indexPath = IndexPath(row: Int(key)!, section: 0)
                    let cell = gymTableView.cellForRow(at: indexPath) as? GymTableViewCell
                    let selected = UserData.tallyScore[key]

                    switch selected {
                        case 1:
                            cell?.fRateImage1.alpha = 1
                        case 2:
                            cell?.fRateImage2.alpha = 1
                        case 3:
                            cell?.fRateImage3.alpha = 1
                        case 4:
                            cell?.fRateImage4.alpha = 1
                        default:
                            cell?.fRateImage5.alpha = 1
                    }

                }

            }
            
        }
        
        
        
    
    
    @IBAction func goback(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil);
    }


}
