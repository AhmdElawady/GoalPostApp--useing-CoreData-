//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Awady on 5/28/20.
//  Copyright © 2020 Ahmed Elawady. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescribtion: String!
    var goalType: GoalType!
    
    func initData(describtion: String, type: GoalType) {
        self.goalDescribtion = describtion
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeybouard()
        pointsTextField.delegate = self
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescribtion
        goal.goalType = goalType.rawValue
        goal.goalComletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        do {
            try managedContext.save()
            print("Sucess saved")
            completion(true)
        } catch {
            debugPrint("Could not save \(error.localizedDescription)")
            completion(false)
        }
    }
}
