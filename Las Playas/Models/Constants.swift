//
//  Constants.swift
//  ResortFeedback-IOS
//
//  Created by Maricel Sumulong on 3/5/22.
//

struct r {
    
    static let registerSegue = "RegisterToHome"
    static let loginSegue = "LoginToHome"
    static let cellIdentifier = "UserChoiceCell"
    static let homeNibName = "HomeCollectionViewCell"
    static let surveySegue = "SurveyOptions"
    static let constructionSegue = "UnderConstruction"
    static let constructionSegue2 = "UnderConstruction2"
    static let surveyNibName = "SurveyOptionsCollectionViewCell"
    static let surveyCellIdentifier = "SurveyChoiceCell"
    static let foodCellIdentifier = "FoodViewCell"
    static let foodNibName = "FoodTableViewCell"
    static let foodSegue = "FoodSurvey"
    static let foodRateCellIdentifier = "FoodRatingViewCell"
    static let foodRateNibName = "FoodRatingTableViewCell"
    static let backToSurveyHome = "BackToHome"
    static let hometoDelete = "HomeToDelete"
    static let deleteTableViewCell = "DeleteTableViewCell"
    static let deleteNibName = "DeleteTableViewCell"
    static let backToFeedbackHome = "BackToFeedbackHome"
    static let feedbackSegue = "OverAllFeedback"

}

struct questions {
    
    static let foodQuestions = [
        "1. The food is served fresh and hot.",
        "2. The menu has a good variety of items.",
        "3. The quality of food is excellent.",
        "4. The food is tasty and flavorful.",
        "5. The quality of beverages is excellent.",
        "6. My food order was correct and complete.",
        "7. Employees are patient when taking my order.",
        "8. I was served promptly.",
        "9. Availability of sauces, utensils, napkins, etc. was good.",
        "10. The menu board was easy to read."
//        "11. Employees speak clearly.",
//        "12. Employees are friendly and courteous.",
//        "13. The service is excellent.",
//        "14 The value for price paid was excellent.",
//        "15. The food is a good value for the dollar.",
//        "16. Prices are competitive."
    ]
    
}

struct mainMenu {
    
    var userChoices : [String] = [
        "Answer Survey",
//        "Change Username",
//        "Change Password",
        "View My Ratings",
        "Edit My Ratings",
        "Delete My Rating",
        "View Other's Ratings",
        "Settings",
        "Games"
    ]
    
    var userChoicesIcon : [String] = [
        "survey",
//        "username",
//        "password",
        "review",
        "edit",
        "deleteRating",
        "response",
        "settings",
        "games"
    ]
    
    var surveyChoices : [String] = [
        "Rooms",
        "Gym",
        "Food",
        "Overall Feedback"
    ]
    
    var surveyChoicesIcon : [String] = [
        "room",
        "gym",
        "food",
        "feedback"
    ]
    
}
