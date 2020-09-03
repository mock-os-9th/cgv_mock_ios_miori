//
//  TheaterRMainViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/02.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit




class TheaterRMainViewController: UIViewController {
    
    //bottom sheet 기본 호출
    let bottomLauncher = BottomSheetLauncher()
    let bottomLauncherUsingFrames = BottomSheetUsingFrames()
    let sheetVc = SheetViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //Dispatch Queue를 이용해 bottom sheet 1초 후에 띄우기
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            //print("hello")
            self.sheetVc.view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(self.sheetVc.view)
            
            NSLayoutConstraint.activate([
                self.sheetVc.view.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.sheetVc.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.sheetVc.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                self.sheetVc.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ])
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



