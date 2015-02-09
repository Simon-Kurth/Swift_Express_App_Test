//
//  AddNoteViewController.swift
//  NoteApp
//
//  Created by Simon Kurth on 1/24/2015.
//  Copyright (c) 2015 Simon Kurth. All rights reserved.
//

import UIKit

protocol AddNoteViewControllerDelegate {
    func saveNote(controller:AddNoteViewController,noteText:String)
    func dismissAddViewController(controller:AddNoteViewController)
}

class AddNoteViewController: UIViewController, UITextFieldDelegate {

    var delegate:AddNoteViewControllerDelegate?
    @IBOutlet var noteField:UITextField?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelPressed(sender: AnyObject?) -> Void {
        delegate?.dismissAddViewController(self)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        delegate?.saveNote(self, noteText: textField.text)
        
        return true
    }

}
