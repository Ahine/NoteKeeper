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

    convenience init?(body: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: Note.entity(), insertInto: managedContext)
        
        self.title = body.count > 24 ? String(body.prefix(25)) : body
        self.body = body
    }
}
