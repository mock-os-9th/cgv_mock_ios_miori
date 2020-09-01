//
//  CJ1ViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class CJ1ViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        let width = self.view.frame.width
        
        
        
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y:35
            , width: width, height: 44))
        self.view.addSubview(navigationBar);
        //let navigationItem = UINavigationItem(title: "Navigation bar")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "X", style: .plain, target: self, action: #selector(backAction))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        navigationBar.setItems([navigationItem], animated: false)
        
    }
    
    @objc func backAction(){
          //print("Back Button Clicked")
          dismiss(animated: true, completion: nil)
      }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
