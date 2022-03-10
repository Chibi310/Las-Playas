//
//  RoomSurveyViewController.swift
//  ResortFeedback-IOS
//
//  Created by Pablo De La Cruz on 3/9/22.
//


import UIKit

class RoomSurveyViewController: UIViewController {

    
    @IBOutlet weak var roomTableView: UITableView!
    var tallyScore : [String : Int] = [:]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        roomTableView.delegate = self
        roomTableView.dataSource = self
        roomTableView.register(UINib(nibName: r.foodNibName, bundle: nil), forCellReuseIdentifier: r.foodCellIdentifier)
        
    }
    @IBAction func BackButton()
    {
        self.dismiss(animated: true, completion: nil);
    }


    @IBAction func submitRoomResponse(_ sender: Any) {
        let scoreArray = [Int](repeating: 0, count: questions.roomQuestions.count)
        var tallyArray = ["Room":scoreArray]
        
        for key in UserData.tallyScore.keys {
            tallyArray["Room"]![Int(key)!] = UserData.tallyScore[key]!
            
        }
        
        //print(tallyArray.description)
        
        
        let isSuccess = DBSource.instance.addUserFoodTally(u: UserData.userInfo, t: tallyArray.description)

        if isSuccess == true {

            showAlertDialog(dtype: "Alert", msg: "Response Successfully Saved! Redirecting You Back To Survey Home Page", style: "alert", controller : r.roomBackToSurveyHome)

            //print("Under Construction!")

        } else {

            showAlertDialog(dtype: "Alert", msg: "Response Not Successfully Saved.", style: "alert", controller: "")

          }
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
//                        self.goToNextController(segueId: controller)
                        self.dismiss(animated: true, completion: nil);

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RoomSurveyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        
            case 0:
                //print("ROWS: ",r.questions.count * 2)
                //return r.questions.count + 1
            return min(questions.roomQuestions.count, 10)
            default:
                return 0
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
            case 0:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: r.foodCellIdentifier, for: indexPath) as! FoodTableViewCell
                
                cell.question.text = questions.roomQuestions[indexPath.row]
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
                let defCell = tableView.dequeueReusableCell(withIdentifier: r.foodCellIdentifier, for: indexPath)
                print("no default")
                return defCell
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
}

extension RoomSurveyViewController: UITableViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
        if UserData.tallyScore.count != 0 {
            for key in UserData.tallyScore.keys{
                let indexPath = IndexPath(row: Int(key)!, section: 0)
                let cell = roomTableView.cellForRow(at: indexPath) as? FoodTableViewCell
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
    
}
