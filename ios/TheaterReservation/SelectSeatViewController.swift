//
//  SelectSeatViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/10.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SelectSeatViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
 
     
    }
    
    @IBAction func tapToPay(_ sender: UIButton) {
        let payVC = UINavigationController(rootViewController: KakaopayViewController(nibName: "KakaopayViewController", bundle: nil))
        payVC.modalPresentationStyle = .fullScreen
        self.present(payVC, animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        //navibar 숨기기
        //복구가 안될때는 : 뷰의 top을 superview로 맞춰주고 constant는 0으로
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        //왼쪽 엑스버튼
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(backAction))
        //틴트는 검정색
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        //배경은 화이트
        self.navigationController?.navigationBar.barTintColor = .darkGray
        //라인 지우기
        //self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    
    @objc func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
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
