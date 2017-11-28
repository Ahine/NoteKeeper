//
//  NoteDetailViewController.swift
//  NoteKeeper
//
//  Created by Andy Hine on 11/27/17.
//  Copyright © 2017 Andy Hine. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {

    @IBOutlet weak var bodyText: UITextView!
    
    var existingNote: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodyText.text = existingNote?.body
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveNote(_ sender: Any) {
        let body = bodyText.text ?? ""
        
        var note: Note?
        
        if let existingNote = existingNote{
            existingNote.body = body
            existingNote.title = body.count > 24 ? String(body.prefix(25)) : body
            note = existingNote
        }else{
            note = Note(body: body)
        }
        
        if let note = note{
            do{
                let managedContext = note.managedObjectContext
                try managedContext?.save()
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("Context could not be saved")
            }
        }
        
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
