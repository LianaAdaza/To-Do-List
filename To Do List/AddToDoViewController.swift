//
//  AddToDoViewController.swift
//  To Do List
//
//  Created by Liana Adaza on 7/13/20.
//  Copyright © 2020 Liana Adaza. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
   // We have to grab this view context to be able to work with Core Data
           if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

             // We are creating a new ToDoCD object here, naming it toDo
             let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)

             // If the titleTextField has text, we will call that text titleText
             if let titleText = titleTextField.text {
                 // We will take the titleText and assign that value to toDo.name
                 // This .name and .important came from the attributes typed on the Core Data page!
                 toDo.name = titleText
                 toDo.important = importantSwitch.isOn
             }

             try? context.save()

             navigationController?.popViewController(animated: true)
           }
    }
}
