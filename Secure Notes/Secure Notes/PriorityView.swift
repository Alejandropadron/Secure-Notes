//
//  PriorityView.swift
//  Secure Notes
//
//  Created by Alejandro Padron on 4/3/16.
//  Copyright © 2016 Alejandro Padron. All rights reserved.
//

import UIKit

class PriorityView: UIView {

  //MARK: Properties
    var priority = 0{
        didSet  {
            setNeedsLayout()
        }
    }
    var priorityButtons = [UIButton]()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        // Set images
        let filledPriorityImage = UIImage(named: "PriorityFilled")
        let priorityImage = UIImage(named: "PriorityNotFilled")
        
        // Loop to create five of these buttons ^^
        for _ in 0..<5 {
            // Create buttons
            let button = UIButton()
            button.addTarget(self, action: #selector(PriorityView.priorityButtonTapped(_:)), forControlEvents: .TouchDown)
            // Set image for button
            button.setImage(priorityImage, forState: .Normal)
            button.setImage(filledPriorityImage, forState: [.Highlighted, .Selected])
            button.adjustsImageWhenHighlighted = false
            // Add to view
            priorityButtons += [button]
            addSubview(button)
            
        }
    }
    override func layoutSubviews() {
        let PrioritySize = Int(frame.size.height)
        var buttonFrame = CGRect(x:0, y: 0, width: 44, height: 44)
        
        for (index, button) in priorityButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (PrioritySize * (5 - 1)))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionState()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let prioritySize = Int(frame.size.height)
        let width = (prioritySize * 5) + (5 * (5 - 1))
        
        return CGSize(width: width, height: prioritySize)
    }
    
    //MARK: Actions
    func priorityButtonTapped(button: UIButton) -> Void {
        priority = priorityButtons.indexOf(button)! + 1
        updateButtonSelectionState()
    }
    
    func updateButtonSelectionState() {
        for (index, button) in priorityButtons.enumerate() {
            button.selected = index < priority
        }
    }
    
}
