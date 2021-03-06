//
//  WorkoutPlanFrontBack.swift
//  FitApp
//
//  Created by Siddharth Patel on 2/9/16.
//  Copyright © 2016 Siddharth Patel. All rights reserved.
//

import Foundation
import UIKit
import Parse

class WorkoutPlanFrontBack: UIViewController{
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var DegreeButton: UIButton!
//-------------------@@@@@@@ Front Body Parts @@@@@@@@@------------------------------------//
    @IBOutlet weak var chestButton: UIButton! //Marks:- Chest button
    
    @IBOutlet weak var arm1: UIButton! //marks:- Biceps button
    @IBOutlet weak var core1: UIButton! //marks:- Core button
    
    @IBOutlet weak var Thigh1: UIButton! //marks:- Thigh button
    
//-------------------@@@@@@@ Back Body Parts @@@@@@@@@------------------------------------//
    @IBOutlet weak var Calf1: UIButton! //marls:- Calf button
    
    @IBOutlet weak var UpperBack1: UIButton!//marks:- upper back button
    @IBOutlet weak var Traps1: UIButton! //marks:- traps and rear delts button
    @IBOutlet weak var Glutes1: UIButton!//marks:- Glutes button
    
//----------------------------Array data for parse ----------------------------------------//
    
    var BicepsArray = [String]()
    
    var ButtonOn: Bool = false;
    var isRotating = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//marks:- getting Bisceps workout list.
    }
//Marks: changes image to show BackBody.
    func ShowButton()
    {
        let bodyimage: UIImage = UIImage(named: "BackBody.png")!
 //---@@@@@@@ Front Body Parts @@@@@@@@@-------//
        if !isRotating
        {
            let spinAnimation = CABasicAnimation()
            spinAnimation.fromValue = 0
            spinAnimation.toValue = M_PI*2
            spinAnimation.duration = 2
            spinAnimation.repeatCount = Float.infinity
            spinAnimation.isRemovedOnCompletion = false
            spinAnimation.fillMode = kCAFillModeForwards
            spinAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            Calf1.layer.add(spinAnimation, forKey: "transform.rotation.z")
            UpperBack1.layer.add(spinAnimation, forKey: "transform.rotation.z")
            Traps1.layer.add(spinAnimation, forKey: "transform.rotation.z")
            Glutes1.layer.add(spinAnimation, forKey: "transform.rotation.z")
            
        }else
        {
            Calf1.layer.removeAllAnimations()
            UpperBack1.layer.removeAllAnimations()
            Traps1.layer.removeAllAnimations()
            Glutes1.layer.removeAllAnimations()
            
        }
        chestButton.alpha = 0
        arm1.alpha = 0
        core1.alpha = 0
        Thigh1.alpha = 0
        
//--@@@@@@@ Back Body Parts @@@@@@@@@--//
        Calf1.alpha = 1
        UpperBack1.alpha = 1
        Traps1.alpha = 1
        Glutes1.alpha = 1
        images.image = bodyimage
    }
//Marks: changes image to show FrontBody.
    func HideButton()
    {
        let bodyimage: UIImage = UIImage(named: "FrontBody.png")!
 //---@@@@@@@ Front Body Parts @@@@@@@@@-------//
        
        chestButton.alpha = 1
        arm1.alpha = 1
        
        core1.alpha = 1
        Thigh1.alpha = 1
        
//--@@@@@@@ Back Body Parts @@@@@@@@@--//
        Calf1.alpha = 0
        UpperBack1.alpha = 0
        Traps1.alpha = 0
        Glutes1.alpha = 0
        images.image = bodyimage
    }
    
//marks: clicking this button will change the button and images
    
    @IBAction func DegreeButton(_ sender: AnyObject) {
        if !isRotating
        {
            let spinAnimation = CABasicAnimation()
            spinAnimation.fromValue = 0
            spinAnimation.toValue = M_PI*2
            spinAnimation.duration = 2
            spinAnimation.repeatCount = Float.infinity
            spinAnimation.isRemovedOnCompletion = false
            spinAnimation.fillMode = kCAFillModeForwards
            spinAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
             //---@@@@@@@ Only Front Body Parts @@@@@@@@@-------//
            chestButton.layer.add(spinAnimation, forKey: "transform.rotation.z")
            arm1.layer.add(spinAnimation, forKey: "transform.rotation.z")
            core1.layer.add(spinAnimation, forKey: "transform.rotation.z")
            Thigh1.layer.add(spinAnimation, forKey: "transform.rotation.z")
            
            
            
        }else
        {
            //---@@@@@@@  Only Front Body Parts @@@@@@@@@-------//
            chestButton.layer.removeAllAnimations()
            arm1.layer.removeAllAnimations()
            core1.layer.removeAllAnimations()
            Thigh1.layer.removeAllAnimations()
            
        }
            isRotating = !isRotating
        if ButtonOn
            {
                ShowButton()
            }
        else
            {
                HideButton()
            }
    ButtonOn = !ButtonOn
    }

   
//Marks:- Bring back user to body part page
    @IBAction  func unwindForBodyBuilding(_ unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
    }

}


    

