//
//  CentralMenu.swift
//  Las Playas
//
//  Created by Maricel Sumulong on 3/9/22.
//

import UIKit

class CentralMenu: UIViewController {

    @IBOutlet weak var welcomeTextView: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let homeOptions = mainMenu().userChoices
    let homeIcons = mainMenu().userChoicesIcon
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        welcomeTextView.text = "Welcome, \(UserData.userInfo)!"
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: r.homeNibName, bundle: nil), forCellWithReuseIdentifier: r.cellIdentifier)
        let fixCenter = UserData()
        fixCenter.centerCollectionView(collectionView: collectionView)
        
    }

    @IBAction func logoutPressed(_ sender: UIButton) {
        
        //self.dismiss(animated: true, completion: nil)
        UserData.userInfo = ""
        UserData.tallyScore = [:]
        let WC = storyboard?.instantiateViewController(identifier: "Welcome") as! ViewController;
        present(WC, animated: true);
        
    }
    
    func showAlertDialog(dtype: String, msg: String, style: String) {
        
        var dialogMessage = UIAlertController()
        var ok = UIAlertAction()
        
        switch style.lowercased() {
            case "alert":
                dialogMessage = UIAlertController(title: dtype, message: msg, preferredStyle: .alert)
                //ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in})
                ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                })
                dialogMessage.addAction(ok)
            default:
                print("No alert available")
        }
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
}

extension CentralMenu: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return homeOptions.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: r.cellIdentifier, for: indexPath) as! HomeCollectionViewCell
        
//        if UserData.userInfo != "admin" && indexPath.row == homeOptions.count - 1 {
//
//            cell.homeImageView.image = UIImage()
//            cell.homeLabel.text = ""
//
//        } else {
            
            cell.homeImageView.image = UIImage(named: homeIcons[indexPath.row])
            cell.homeLabel.text = homeOptions[indexPath.row]
        
//          }
        
        return cell
        
        
    }
    
    
}

extension CentralMenu: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
            case 0:
//                print("Time To Answer Survey")
//                performSegue(withIdentifier: r.surveySegue, sender: self)
                let RC = storyboard?.instantiateViewController(identifier: "Survey_Menu") as! SurveyOptions
                present(RC, animated: true);
            case 2:
            
            if UserData.userScore == "" {
                showAlertDialog(dtype: "Alert", msg: "No ratings to edit!", style: "alert")
            } else {
                let RC = storyboard?.instantiateViewController(identifier: "Edit_Survey") as! EditRatingsViewController
                present(RC, animated: true);
            }
            
                
            case 7:
                print("Clears Database")
                //performSegue(withIdentifier: r.hometoDelete, sender: self)
                //showAlertDialog(dtype: "Confirm", msg: "This action can't be undone. Do you still want to proceed?", style: "alert", controller: "1")
            
            default:
                let FC = storyboard?.instantiateViewController(identifier: "Settings_Menu") as! Settings;
                present(FC, animated: true);
                //print("Under Construction")
                //performSegue(withIdentifier: r.constructionSegue, sender: self)
        }
        
    }
    
}
