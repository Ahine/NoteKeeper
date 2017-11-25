//
//  Note+CoreDataClass.swift
//  NoteKeeper
//
//  Created by Andy Hine on 11/25/17.
//  Copyright © 2017 Andy Hine. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    var date:Date?{
        get{
            return rawDateCreated as Date?
        }
        set{
            rawDateCreated = newValue as NSDate?
        }
    }

    convenience init?(body: String, date: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: Note.entity(), insertInto: managedContext)
        
        self.title = body.count > 10 ? String(body.prefix(11)) : body
        self.body = body
        self.date = date
    }
}
