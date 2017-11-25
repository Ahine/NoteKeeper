//
//  Note+CoreDataProperties.swift
//  NoteKeeper
//
//  Created by Andy Hine on 11/25/17.
//  Copyright © 2017 Andy Hine. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var rawDateCreated: NSDate?

}
