//
//  DetailViewController.swift
//  To Do Lists
//
//  Created by Kenyan Houck on 2/10/19.
//  Copyright © 2019 Kenyan Houck. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var toDoField: UITextField!
    @IBOutlet weak var toDoNoteView: UITextView!
    
    
    var toDoItem: String?
    var toDoNoteItem: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
        } else {
            self.navigationItem.title = "Edit To Do Item"
        }
        
        if let toDoNoteItem = toDoNoteItem {
           toDoNoteView.text = toDoNoteItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave"
        {
            toDoItem = toDoField.text
            toDoNoteItem = toDoNoteView.text
        }
    }
    
    
    func enableDisableSaveButton(){
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0{
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
       enableDisableSaveButton()
        
        
        
        
//        if toDoField.text!.count > 0
//        {
//            saveBarButton.isEnabled = true
//        } else {
//            saveBarButton.isEnabled = false
//        }
    }
    
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}
