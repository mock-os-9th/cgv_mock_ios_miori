//
//  HomeViewController.swift
//  ios
//
//  Created by miori Lee on 2020/08/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //self.navigationItem.title = "CGV"
        
        // CGV 버튼 생성
        let cgv_logo_btn = UIButton(type: .custom)
        // 버튼 이미지 생성
        cgv_logo_btn.setImage(UIImage(named: "cgv_logo.png"), for: .normal)
        // didTap 함수
        cgv_logo_btn.addTarget(self, action: #selector(cgvlogoDidTap), for: .touchUpInside)
        // frame 생성
        cgv_logo_btn.frame = CGRect(x: 0, y: 0, width: 53, height: 53)

        // bar button 연결
        let barButton = UIBarButtonItem(customView: cgv_logo_btn)
        // navigation의 왼쪽에 bar button을 넣어
        self.navigationItem.leftBarButtonItem = barButton
        
    }
    //This method will call when you press button.
    @objc func cgvlogoDidTap() {
        print("clicked")
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
