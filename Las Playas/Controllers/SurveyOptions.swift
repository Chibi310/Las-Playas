//
//  SurveyOptions.swift
//  Las Playas
//
//  Created by Maricel Sumulong on 3/9/22.
//

import UIKit

class SurveyOptions: UIViewController {

    @IBOutlet weak var surveyCollectionView: UICollectionView!
    
    @IBOutlet weak var surveyIntroTextView: UITextView!
    
    let surveyOptions = mainMenu().surveyChoices
    let surveyIcons = mainMenu().surveyChoicesIcon
    
    override func viewDidLoad() {
        super.viewDidLoad()
        surveyIntroTextView.text = "    Hi, \(UserData.userInfo)! Help us improve and serve better to customers like you. Simply select any of the options below and fill up all the questions provided. Any feedback are highly appreciated."
        surveyCollectionView.dataSource = self
        surveyCollectionView.delegate = self
        surveyCollectionView.register(UINib(nibName: r.surveyNibName, bundle: nil), forCellWithReuseIdentifier: r.surveyCellIdentifier)
        
        let fixCenter = UserData()
        fixCenter.centerCollectionView(collectionView: surveyCollectionView)

    }
    
    @IBAction func backButtonToHome(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        let WC = storyboard?.instantiateViewController(identifier: "Main_Menu") as! CentralMenu;
        present(WC, animated: true);
        
    }

}

extension SurveyOptions: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return surveyOptions.count

    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: r.surveyCellIdentifier, for: indexPath) as! SurveyOptionsCollectionViewCell

        cell.surveyImageView.image = UIImage(named: surveyIcons[indexPath.row])
        cell.surveyLabel.text = surveyOptions[indexPath.row]

        return cell

    }



}

extension SurveyOptions: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
            case 0:
                print("Time To Answer Room Survey")
//                performSegue(withIdentifier: r.surveySegue, sender: self)
//                let RC = storyboard?.instantiateViewController(identifier: "Main_Survey_Menu") as! SurveyOptions;
//                present(RC, animated: true);
            case 1:
                print("Time To Answer Gym Survey")
                //performSegue(withIdentifier: r.hometoDelete, sender: self)
                //showAlertDialog(dtype: "Confirm", msg: "This action can't be undone. Do you still want to proceed?", style: "alert", controller: "1")
            case 2:
                let FC = storyboard?.instantiateViewController(identifier: "Food_Menu") as! Food;
                present(FC, animated: true);
            case 3:
                let FBC = storyboard?.instantiateViewController(identifier: "Overall_Feedback") as! Feedback;
                present(FBC, animated: true);
            default:
                print("Under Construction")
                //performSegue(withIdentifier: r.constructionSegue, sender: self)
        }
        
    }
}
