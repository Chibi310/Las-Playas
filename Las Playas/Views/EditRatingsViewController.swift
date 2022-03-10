//
//  EditRatingsViewController.swift
//  Las Playas
//
//  Created by Maricel Sumulong on 3/10/22.
//

import UIKit

class EditRatingsViewController: UIViewController {

    @IBOutlet weak var editSurveyIntroTextView: UITextView!
    @IBOutlet weak var editSurveyCollectionView: UICollectionView!
    
    let surveyOptions = mainMenu().surveyChoices
    let surveyIcons = mainMenu().surveyChoicesIcon
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editSurveyIntroTextView.text = "    Hi, \(UserData.userInfo)! Change of heart? Feel free to do any modifications you see fit during your stay."
        editSurveyCollectionView.dataSource = self
        editSurveyCollectionView.delegate = self
        editSurveyCollectionView.register(UINib(nibName: r.surveyNibName, bundle: nil), forCellWithReuseIdentifier: r.editSurveyCellIdentifier)
        
        let fixCenter = UserData()
        fixCenter.centerCollectionView(collectionView: editSurveyCollectionView)
    }
    
    @IBAction func backButtonToSurveyPressed(_ sender: UIButton) {
        
        let esvc = storyboard?.instantiateViewController(withIdentifier: "Main_Menu") as! CentralMenu
        present(esvc, animated: true, completion: nil)
        
    }
    
}

extension EditRatingsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return surveyOptions.count

    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: r.editSurveyCellIdentifier, for: indexPath) as! SurveyOptionsCollectionViewCell

        cell.surveyImageView.image = UIImage(named: surveyIcons[indexPath.row])
        cell.surveyLabel.text = surveyOptions[indexPath.row]

        return cell

    }



}

extension EditRatingsViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.item {
            
            case 2:
                let svc = storyboard?.instantiateViewController(withIdentifier: "Edit_Food_Survey") as! EditFood
                present(svc, animated: true, completion: nil)
            default:
                let svc = storyboard?.instantiateViewController(withIdentifier: "Room_Menu") as! Room
                present(svc, animated: true, completion: nil)
            
        }
        
    }
}
