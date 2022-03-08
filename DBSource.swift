//
//  DBSource.swift
//  Las Playas
//
//  Created by Christopher Medina on 3/8/22.
//

import Foundation
import UIKit
import CoreData


class DBSource
{
    let Context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext;
    static var instance = DBSource();
    
    func RegUser(_ UName: String, _ UPass: String)
    {
        let neo = NSEntityDescription.insertNewObject(forEntityName: "DBD", into: Context!) as! DBD;
        
        neo.userName = UName;
        neo.password = UPass;
        
        do { try Context?.save(); }
        catch { print("Error: Failed to Save"); }
    }
    
    
    func CheckUserData(_ UName: String) -> DBD?
    {
        var Usr : DBD?
        let FetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DBD");
        FetchRequest.predicate = NSPredicate(format: "userName == %@", UName);
        FetchRequest.fetchLimit = 1;
        
        do
        {
            let request = try Context?.fetch(FetchRequest) as! [DBD];
            if(0 != request.count)
            {
                Usr = request.first as! DBD;
            }
            else
            {
            }
        }
        catch {}
        
        return Usr;
    }
}
