//
//  ContainerHomeViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/07.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class ContainerHomeViewController: UIViewController {

    @IBOutlet weak var adImage: UIImageView!
    @IBOutlet weak var adImage2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        adImage.isHidden = true
        adImage2.isHidden = true

        // Do any additional setup after loading the view.
        
        //Dispatch Queue를 이용해 bottom sheet 1초 후에 띄우기
        let seconds = 1.5
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            //print("hello")
            self.adImage.isHidden = false
            self.adImage2.isHidden = false
            
            
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

}
