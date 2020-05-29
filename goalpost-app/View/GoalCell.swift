//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Awady on 5/23/20.
//  Copyright © 2020 Ahmed Elawady. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTybeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    @IBOutlet weak var completionView: UIView!
    func cofigureCell(goal: Goal) {
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTybeLabel.text = goal.goalType
        self.goalProgressLabel.text = String(goal.goalProgress)
        
        if goal.goalProgress == goal.goalComletionValue {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }
}
