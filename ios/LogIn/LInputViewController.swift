//
//  LInputViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class LInputViewController: UIViewController {
    
    @IBAction func pressGetSignUpResult(_ sender: UIButton) {
        SignInDataManager().getLogin(self)
    }

    override func viewWillLayoutSubviews() {
        let width = self.view.frame.width
        
        
        
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y:35
            , width: width, height: 44))
        self.view.addSubview(navigationBar);
        //let navigationItem = UINavigationItem(title: "Navigation bar")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< 로그인", style: .plain, target: self, action: #selector(backAction))
        
        navigationBar.setItems([navigationItem], animated: false)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup if required.
    }
    
    @objc func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapSingUp(_ sender: UIButton) {
        let cj1View = UINavigationController(rootViewController:CJ1ViewController(nibName: "CJ1ViewController", bundle: nil))
        //navigation안에
        cj1View.modalPresentationStyle = .fullScreen
        self.present(cj1View, animated: false, completion: nil)
        //self.navigationController?.pushViewController(cj1View, animated: true)
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
