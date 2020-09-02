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
        
       
        //왼쪽 엑스버튼
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "X", style: .plain, target: self, action: #selector(backAction))
        //틴트는 검정색
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        //배경은 화이트
        self.navigationController?.navigationBar.barTintColor = .white
        //라인 지우기
        self.navigationController?.navigationBar.shadowImage = UIImage()
    
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
