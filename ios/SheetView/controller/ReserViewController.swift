//
//  ReserViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/09.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class ReserViewController: UIViewController {
    
  
    @IBAction func didTap(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
 
    @IBAction func didShare(_ sender: Any) {
        print("share")
    }
    @IBAction func didSelect(_ sender: UIButton) {
        print("hello")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isHidden = true
        
        // Do any additional setup after loading the view.
        
        //Dispatch Queue를 이용해 bottom sheet 1초 후에 띄우기
        let seconds = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            //print("hello")
            self.view.isHidden = false
            //self.adImage2.isHidden = false
        
        }
        
        //peopleSelect.isHidden = true
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

