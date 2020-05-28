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
    
    func cofigureCell(description: String, type: GoalType, goalProgressAmount: Int) {
        self.goalDescriptionLabel.text = description
        self.goalTybeLabel.text = type.rawValue
        self.goalProgressLabel.text = String(describing: goalProgressAmount)
    }
}
